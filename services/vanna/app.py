import os, re, json
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from dotenv import load_dotenv

# Groq client (Vanna can use OpenAI-like providers; we'll manually use Groq for text->SQL)
from groq import Groq

import psycopg
from psycopg.rows import dict_row

load_dotenv()

DB_URL = os.environ.get("DATABASE_URL")
GROQ_API_KEY = os.environ.get("GROQ_API_KEY")
PORT = int(os.environ.get("PORT", "8000"))

if not DB_URL or not GROQ_API_KEY:
    raise RuntimeError("DATABASE_URL and GROQ_API_KEY must be set")

# Connect once for schema introspection + queries
conn = psycopg.connect(DB_URL)
client = Groq(api_key=GROQ_API_KEY)

# Simple schema snapshot for the LLM prompt
def get_schema_markdown():
    with conn.cursor(row_factory=dict_row) as cur:
        cur.execute("""
        SELECT table_name, column_name, data_type
        FROM information_schema.columns
        WHERE table_schema='public'
        ORDER BY table_name, ordinal_position
        """)
        rows = cur.fetchall()
    lines = {}
    for r in rows:
        lines.setdefault(r["table_name"], []).append(f"- {r['column_name']} ({r['data_type']})")
    md = []
    for t, cols in lines.items():
        md.append(f"### {t}\n" + "\n".join(cols))
    return "\n\n".join(md)

SCHEMA_MD = get_schema_markdown()

SYSTEM_PROMPT = f"""
You are a helpful analytics SQL assistant. Generate **PostgreSQL** SQL ONLY.

CRITICAL RULES:
- Only generate **SELECT** statements.
- Never generate INSERT, UPDATE, DELETE, DROP, CREATE, ALTER, or TRUNCATE.
- Never include a trailing semicolon.
- All table names and column names **must be quoted** using double-quotes.

Example Join Patterns to Always Use:

-- Total spend by vendor
SELECT "Vendor"."name", SUM("Invoice"."totalAmount") AS "totalSpend"
FROM "Invoice"
JOIN "Vendor" ON "Invoice"."vendorId" = "Vendor"."id"
GROUP BY "Vendor"."name"
ORDER BY "totalSpend" DESC;

-- Invoice line items
SELECT "Invoice"."invoiceNo", "Vendor"."name", "LineItem"."description", "LineItem"."amount"
FROM "LineItem"
JOIN "Invoice" ON "LineItem"."invoiceId" = "Invoice"."id"
JOIN "Vendor" ON "Invoice"."vendorId" = "Vendor"."id";

Here is the database schema (markdown):

{SCHEMA_MD}
"""

class AskBody(BaseModel):
    question: str

app = FastAPI(title="Vanna AI (Self-Hosted)")

# CORS so Vercel/localhost can call this
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],   # tighten to your domains in prod
    allow_credentials=False,
    allow_methods=["*"],
    allow_headers=["*"],
)

def is_select_only(sql: str) -> bool:
    s = sql.strip().lower()
    # block ; and non-select keywords
    banned = ["insert", "update", "delete", "create", "drop", "alter", "grant", "revoke", "truncate"]
    if ";" in s: 
        return False
    if not s.startswith("select"):
        return False
    return not any(b in s for b in banned)

def generate_sql(question: str) -> str:
    msg = [
        {"role": "system", "content": SYSTEM_PROMPT},
        {"role": "user", "content": f"Question: {question}\nReturn ONLY SQL, nothing else."}
    ]
    chat = client.chat.completions.create(
        model="llama-3.1-8b-instant",   # good balance; adjust if needed
        messages=msg,
        temperature=0.1,
        max_tokens=512,
    )
    text = chat.choices[0].message.content.strip()
    # Extract SQL code fences if present
    m = re.search(r"```sql\s*(.+?)\s*```", text, re.S|re.I)
    sql = m.group(1) if m else text
    sql = sql.strip()
    # Remove trailing semicolon if present
    if sql.endswith(";"): sql = sql[:-1]
    return sql

@app.post("/ask")
def ask(body: AskBody):
    try:
        sql = generate_sql(body.question)
        if not is_select_only(sql):
            raise HTTPException(status_code=400, detail="Generated SQL rejected by safety policy.")

        try:
            with conn.cursor(row_factory=dict_row) as cur:
                cur.execute(sql)
                rows = cur.fetchall()
                cols = list(rows[0].keys()) if rows else []
        except psycopg.Error as e:
            conn.rollback()  # ✅ VERY IMPORTANT
            raise HTTPException(status_code=400, detail=f"SQL error: {e}")

        return {"ok": True, "sql": sql, "columns": cols, "rows": rows}

    except Exception as e:
        conn.rollback()  # ✅ Safety rollback
        raise HTTPException(status_code=500, detail=str(e))

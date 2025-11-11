# AI-Powered Finance Dashboard  

A modern analytics platform that transforms raw finance data into interactive visual insights - dashboard and allows natural-language querying using an AI-based SQL generation engine.

![Next.js](https://img.shields.io/badge/Frontend-Next.js-white?logo=nextdotjs)
![TailwindCSS](https://img.shields.io/badge/UI-TailwindCSS-38BDF8?logo=tailwindcss)
![shadcn/ui](https://img.shields.io/badge/Components-shadcn/ui-black?logo=radixui)
![Recharts](https://img.shields.io/badge/Charts-Recharts-orange?logo=recharts)

![Express](https://img.shields.io/badge/API-Express-green?logo=node.js)
![REST API](https://img.shields.io/badge/Style-REST%20API-yellow)

![Prisma](https://img.shields.io/badge/ORM-Prisma-2D3748?logo=prisma)
![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-blue?logo=postgresql)

![FastAPI](https://img.shields.io/badge/AI%20Service-FastAPI-009688?logo=fastapi)
![Vanna AI](https://img.shields.io/badge/NL→SQL-Vanna_AI-5B21B6)

![Vercel Deploy](https://img.shields.io/badge/Deploy-Vercel-black?logo=vercel)
![Fly.io Backend](https://img.shields.io/badge/LLM%20Service-Fly.io-blue?logo=flydotio)

---

## 🚀 Overview

**AI-Powered Finance Dashboard** enables organizations to analyze invoice spending, vendor performance, and financial patterns using interactive visualizations alongside **AI-assisted data exploration**.

Users can:
- View vendor spend trends, category spend, invoice breakdowns, and cashflow forecasts.
- Ask natural-language questions (e.g., *"Top vendors by spend this quarter?"*)
- Automatically generate SQL from natural language using **Groq LLM**.
- Execute SQL on a **PostgreSQL (Neon)** warehouse.
- Visualize results instantly in charts + tables.
- Export results to CSV.

---

## 🧠 Architecture

                    ┌───────────────────────────────┐
                    │   Frontend (Next.js + Tailwind)│
                    │        https://<frontend>       │
                    └───────────────┬─────────────────┘
                                    │ REST/JSON
                                    ▼
                    ┌────────────────────────────────┐
                    │   API (Node.js + Express + Prisma)│
                    │ https://<api>.vercel.app         │
                    └───────────────┬──────────────────┘
                                    │ POST /ask
                                    ▼
            ┌────────────────────────────────────────────────┐
            │   AI SQL Engine (FastAPI + Groq LLM) on Fly.io │
            │ https://vanna-analytics-ai.fly.dev/ask         │
            └───────────────┬────────────────────────────────┘
                            │
                            ▼
                    ┌───────────────────────┐
                    │   Neon PostgreSQL DB  │
                    └───────────────────────┘

---

## 🛠 Tech Stack

| Layer | Technology |
|------|------------|
| **Frontend** | Next.js, TailwindCSS, shadcn/ui, Recharts |
| **Backend API** | Express.js, Prisma ORM |
| **AI Query Engine** | FastAPI, Groq LLM (`llama-3.1-8b-instant`) |
| **Database** | PostgreSQL (Neon Cloud) |
| **Deployment** | Vercel (API + Web), Fly.io (AI Service) |

---

## ✨ Features

- Dashboard visualizations:
  - Vendor-wise Spend
  - Category Spend Breakdown
  - Cash Outflow Trend
  - Invoice Statistics
- **AI-Powered Querying**
  - Convert natural language → SQL → Executed query → Data visualization
- Fully serverless deployment
- CSV export for downloaded result tables
- Clean professional UI with responsive layout

---

## 💻 Clone & Setup

```bash
# 1) Clone the Repository
git clone https://github.com/RohithReddyGK/AI-Powered-Finance-Dashboard.git

cd AI-Powered-Finance-Dashboard
```

## ▶️ Running Locally
### 1) Start Backend API (Express + Prisma)
```bash
cd apps/api
npm install
```
# Generate Prisma Client
```bash
npm run prisma:generate
```
# Start local dev server
```bash
npm run dev
```
```bash
The API will start at:
http://localhost:4000
```

### 2) Start Frontend (Next.js Dashboard UI)
```bash
cd apps/web
npm install
```
# Start dev server
```bash
npm run dev
```
```bash
The web UI will open at:
http://localhost:3000
```

### 3) Start the AI Query Service (Vanna on FastAPI + Groq)
```bash
cd services/vanna
```
# Activate your Python virtual environment
```bash
analytics/Scripts/activate
```
# Install Python dependencies
```bash
pip install -r requirements.txt
```
# Run the LLM SQL Engine
```bash
uvicorn app:app --reload
```
```bash
The AI /ask endpoint runs at:
http://localhost:8000/ask
```

### ✅ Make sure .env files are configured

#### apps/api/.env
```bash
VANNA_URL=https://localhost:8000
VANNA_DB_URL=postgres://...
GROQ_API_KEY=api_key
```
#### apps/web/.env.local
```bash
NEXT_PUBLIC_API_BASE=http://localhost:4000
NEXT_PUBLIC_APP_URL=http://localhost:3000
```
#### services/vanna/.env
```bash
DATABASE_URL=postgresql://...
GROQ_API_KEY=api_key
PORT=8000
```
#### Everything is now linked:

Next.js UI → Express API → FastAPI LLM Engine → PostgreSQL (Neon)

## 🌐 Deployment

| Component  | Platform | Deployment Link |
| ---------- | -------- | ------------------ |
| Web        | Vercel   |  [FrontEnd Web](https://ai-powered-finance-dashboard.vercel.app/)|
| Backend(API)| Vercel   | [BackEnd Service](https://ai-powered-finance-dashboard-api.vercel.app/)|
| AI Service | Fly.io   | [Vanna AI](https://vanna-analytics-ai.fly.dev/)|






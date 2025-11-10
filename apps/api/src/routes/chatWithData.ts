import { Router } from "express";
import fetch from "node-fetch";

const router = Router();

const VANNA_BASE = process.env.VANNA_API_BASE_URL || "http://localhost:8000";

router.post("/", async (req, res) => {
  try {
    const { question } = req.body as { question?: string };
    if (!question || question.trim().length === 0) {
      return res.status(400).json({ ok: false, error: "Question is required" });
    }

    const r = await fetch(`${VANNA_BASE}/ask`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ question }),
    });

    const data: any = await r.json();
    if (!r.ok) {
      return res.status(r.status).json({ ok: false, error: data.detail || "Vanna error" });
    }

    // Optional: enforce rows length limit
    if (Array.isArray(data.rows) && data.rows.length > 1000) {
      data.rows = data.rows.slice(0, 1000);
    }

    return res.json(data);
  } catch (e: any) {
    return res.status(500).json({ ok: false, error: e.message });
  }
});

export default router;

import { Router } from "express";
import { PrismaClient } from "@prisma/client";
import { addDays } from "date-fns";

const router = Router();
const prisma = new PrismaClient();

router.get('/', async (req, res) => {
  try {
    const invoices = await prisma.invoice.findMany({
      select: { date: true, totalAmount: true }
    });

    const forecast: Record<string, number> = {};

    for (const inv of invoices) {
      const invoiceDate = new Date(inv.date);
      const paymentDate = addDays(invoiceDate, 30);

      const key = `${paymentDate.getFullYear()}-${String(paymentDate.getMonth() + 1).padStart(2, '0')}`;

      forecast[key] = (forecast[key] || 0) + Number(inv.totalAmount);
    }

    const result = Object.entries(forecast).map(([month, spend]) => ({
      month,
      projectedOutflow: spend
    }))
    .sort((a, b) => a.month.localeCompare(b.month));

    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
});

export default router;

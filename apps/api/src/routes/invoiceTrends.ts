import { Router } from "express";
import { PrismaClient } from "@prisma/client";
import { startOfMonth, endOfMonth } from "date-fns";

const router = Router();
const prisma = new PrismaClient();

router.get('/', async (req, res) => {
  try {
    const invoices = await prisma.invoice.findMany({
      select: {
        date: true,
        totalAmount: true
      }
    });

    const grouped: Record<string, { count: number; spend: number }> = {};

    for (const inv of invoices) {
      const date = new Date(inv.date);
      const key = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}`;

      if (!grouped[key]) grouped[key] = { count: 0, spend: 0 };
      grouped[key].count++;
      grouped[key].spend += Number(inv.totalAmount);
    }

    const result = Object.entries(grouped).map(([month, data]) => ({
      month,
      invoiceCount: data.count,
      totalSpend: data.spend
    }));

    res.json(result.sort((a, b) => a.month.localeCompare(b.month)));
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
});

export default router;

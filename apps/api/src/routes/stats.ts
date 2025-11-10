import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

router.get('/', async (req, res) => {
  try {
    const totalSpend = await prisma.invoice.aggregate({
      _sum: { totalAmount: true }
    });

    const invoiceCount = await prisma.invoice.count();

    const avgInvoice = await prisma.invoice.aggregate({
      _avg: { totalAmount: true }
    });

    res.json({
      totalSpend: Number(totalSpend._sum.totalAmount || 0),
      totalInvoices: invoiceCount,
      documentsUploaded: invoiceCount,
      averageInvoiceValue: Number(avgInvoice._avg.totalAmount || 0),
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
});

export default router;

import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

router.get('/', async (req, res) => {
  try {
    const data = await prisma.invoice.groupBy({
      by: ['vendorId'],
      _sum: { totalAmount: true },
    });

    const vendors = await prisma.vendor.findMany();

    const result = data.map(entry => {
      const vendor = vendors.find(v => v.id === entry.vendorId);
      return {
        vendorName: vendor?.name || "Unknown Vendor",
        totalSpend: Number(entry._sum.totalAmount || 0)
      };
    }).sort((a, b) => b.totalSpend - a.totalSpend);

    res.json(result.slice(0, 10));
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
});

export default router;

import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

router.get('/', async (req, res) => {
  try {
    const {
      page = "1",
      limit = "10",
      search = "",
      sort = "date",
      order = "desc"
    } = req.query;

    const pageInt = parseInt(page as string);
    const limitInt = parseInt(limit as string);

    const invoices = await prisma.invoice.findMany({
      skip: (pageInt - 1) * limitInt,
      take: limitInt,
      where: {
        OR: [
          { invoiceNo: { contains: search as string, mode: "insensitive" } },
          { vendor: { name: { contains: search as string, mode: "insensitive" } } }
        ]
      },
      orderBy: {
        [sort as string]: order === "asc" ? "asc" : "desc"
      },
      include: {
        vendor: true
      }
    });

    const total = await prisma.invoice.count({
      where: {
        OR: [
          { invoiceNo: { contains: search as string, mode: "insensitive" } },
          { vendor: { name: { contains: search as string, mode: "insensitive" } } }
        ]
      }
    });

    res.json({
      data: invoices.map(inv => ({
        id: inv.id,
        vendorName: inv.vendor.name,
        invoiceNo: inv.invoiceNo,
        date: inv.date,
        totalAmount: inv.totalAmount,
        status: inv.status,
      })),
      pagination: {
        page: pageInt,
        limit: limitInt,
        total,
        pages: Math.ceil(total / limitInt),
      }
    });

  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
});

export default router;

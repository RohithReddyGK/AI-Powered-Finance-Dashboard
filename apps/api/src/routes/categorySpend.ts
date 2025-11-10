import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

function mapAccountToCategory(account?: string): string {
  if (!account) return "Uncategorized";

  const num = parseInt(account);

  if (num >= 4400 && num <= 4499) return "Services";
  if (num >= 3000 && num <= 3999) return "Goods";
  if (num >= 8000) return "Miscellaneous";

  return "Other";
}

router.get('/', async (req, res) => {
  try {
    const lineItems = await prisma.lineItem.findMany({
      select: {
        unitPrice: true,
        quantity: true,
        description: true,
      }
    });

    const categoryTotals: Record<string, number> = {};

    for (const item of lineItems) {
      // Infer category from description keywords
      const category = mapAccountToCategory(item.description);

      const total = Number(item.unitPrice) * item.quantity;

      categoryTotals[category] = (categoryTotals[category] || 0) + total;
    }

    const result = Object.entries(categoryTotals)
      .map(([category, amount]) => ({
        category,
        totalSpend: amount
      }))
      .sort((a, b) => b.totalSpend - a.totalSpend);

    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
});

export default router;

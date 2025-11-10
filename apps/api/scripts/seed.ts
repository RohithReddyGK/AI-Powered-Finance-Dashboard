import { PrismaClient } from '@prisma/client';
import * as fs from 'fs';
import * as path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const prisma = new PrismaClient();

async function main() {
  const filePath = path.join(__dirname, '../../../data/Analytics_Test_Data.json');
  const raw = fs.readFileSync(filePath, 'utf8');
  const records = JSON.parse(raw);

  for (const record of records) {
    const invoiceData = record?.extractedData?.llmData?.invoice?.value;
    const vendorData = record?.extractedData?.llmData?.vendor?.value;
    const summaryData = record?.extractedData?.llmData?.summary?.value;
    const lineItemsData = record?.extractedData?.llmData?.lineItems?.value?.items?.value || [];

    if (!invoiceData || !vendorData || !summaryData) continue;

    const vendorName = vendorData.vendorName?.value || "Unknown Vendor";

    const vendor = await prisma.vendor.upsert({
      where: { name: vendorName },
      update: {},
      create: {
        name: vendorName,
        category: null
      }
    });

    const invoice = await prisma.invoice.create({
      data: {
        invoiceNo: `${invoiceData.invoiceId?.value || 'INV'}-${record._id}`,
        vendorId: vendor.id,
        date: new Date(invoiceData.invoiceDate?.value || new Date()),
        dueDate: null,
        status: record.status || "unknown",
        totalAmount: summaryData.invoiceTotal?.value || 0
      }
    });

    for (const item of lineItemsData) {
      await prisma.lineItem.create({
        data: {
          invoiceId: invoice.id,
          description: item.description?.value || "Item",
          quantity: Math.round(Number(item.quantity?.value ?? 1)),
          unitPrice: Number(item.unitPrice?.value ?? 0)
        }
      });
    }
  }
}

main()
  .then(() => {
    console.log("✅ Data successfully imported.");
    return prisma.$disconnect();
  })
  .catch(err => {
    console.error(err);
    return prisma.$disconnect();
  });

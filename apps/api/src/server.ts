import express from 'express';
import cors from 'cors';
import { PrismaClient } from '@prisma/client';
import statsRouter from './routes/stats.ts';
import invoiceTrendsRouter from './routes/invoiceTrends.ts';
import vendorsTopRouter from './routes/vendorsTop.ts';
import categorySpendRouter from './routes/categorySpend.ts';
import cashOutflowRouter from './routes/cashOutflow.ts';
import invoicesRouter from './routes/invoices.ts';
import chatWithData from './routes/chatWithData.ts';

const app = express();
const prisma = new PrismaClient();

app.use(cors());
app.use(express.json());

app.use('/stats', statsRouter);
app.use('/invoice-trends', invoiceTrendsRouter);
app.use('/vendors/top10', vendorsTopRouter);
app.use('/category-spend', categorySpendRouter);
app.use('/cash-outflow', cashOutflowRouter);
app.use('/invoices', invoicesRouter);
app.use('/chat-with-data',chatWithData)

app.get('/', (req, res) => {
  res.send('API is running.');
});

// Start server
const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`🚀 API server running on http://localhost:${PORT}`);
});

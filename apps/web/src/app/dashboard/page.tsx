"use client";

import { useEffect, useMemo, useState } from "react";

import KpiCard from "@/components/KpiCard";
import InvoiceTrendChart from "@/components/InvoiceTrendChart";
import TopVendorsChart from "@/components/TopVendorsChart";
import CategorySpendPieChart from "@/components/CategorySpendPieChart";
import CashOutflowChart from "@/components/CashOutflowChart";
import InvoiceTable from "@/components/InvoiceTable";
import { Card } from "@/components/ui/card";

export default function DashboardPage() {
  const [stats, setStats] = useState<any>(null);
  const [invoiceTrends, setInvoiceTrends] = useState<any[]>([]);
  const [topVendors, setTopVendors] = useState<any[]>([]);
  const [categorySpend, setCategorySpend] = useState<any[]>([]);
  const [cashOutflow, setCashOutflow] = useState<any[]>([]);
  const [invoices, setInvoices] = useState<any[]>([]);
  const [invoicePagination, setInvoicePagination] = useState<{ total: number; pages: number }>({ total: 0, pages: 1 });
  const [invoicePage, setInvoicePage] = useState(1);

  useEffect(() => {
    Promise.all([
      fetch(`${process.env.NEXT_PUBLIC_API_BASE}/stats`).then((r) => r.json()),
      fetch(`${process.env.NEXT_PUBLIC_API_BASE}/invoice-trends`).then((r) => r.json()),
      fetch(`${process.env.NEXT_PUBLIC_API_BASE}/top10`).then((r) => r.json()),
      fetch(`${process.env.NEXT_PUBLIC_API_BASE}/category-spend`).then((r) => r.json()),
      fetch(`${process.env.NEXT_PUBLIC_API_BASE}/cash-outflow`).then((r) => r.json()),
    ]).then(([statsData, trendsData, vendorsData, categoryData, cashData]) => {
      setStats(statsData);
      setInvoiceTrends(trendsData);
      setTopVendors(vendorsData);
      setCategorySpend(categoryData);
      setCashOutflow(cashData);
    });
  }, []);

  // Fetch Invoices automatically, when page changes.
  useEffect(() => {
    fetch(`${process.env.NEXT_PUBLIC_API_BASE}/invoices?page=${invoicePage}&limit=10`)
      .then((r) => r.json())
      .then((res) => {
        setInvoices(res.data);
        setInvoicePagination(res.pagination);
      });
  }, [invoicePage]);

  // Build sparkline data from trends (last 8 points).
  const spendSpark = useMemo(
    () =>
      invoiceTrends.slice(-8).map((d, i) => ({ x: i, y: Number(d.totalSpend) || 0 })),
    [invoiceTrends]
  );
  const countSpark = useMemo(
    () =>
      invoiceTrends.slice(-8).map((d, i) => ({ x: i, y: Number(d.invoiceCount) || 0 })),
    [invoiceTrends]
  );

  const uploadedSpark = useMemo(
    () =>
      invoiceTrends.slice(-8).map((d, i) => ({
        x: i,
        y: Number(d.invoiceCount) || 0, // using invoice count as proxy for uploads
      })),
    [invoiceTrends]
  );

  const avgValueSpark = useMemo(
    () =>
      invoiceTrends.slice(-8).map((d, i) => ({
        x: i,
        y:
          d.invoiceCount > 0
            ? Number(d.totalSpend) / Number(d.invoiceCount)
            : 0,
      })),
    [invoiceTrends]
  );

  // Simple % deltas (last vs prev) for chip
  const spendDelta = useMemo(() => {
    const last = invoiceTrends.at(-1)?.totalSpend ?? 0;
    const prev = invoiceTrends.at(-2)?.totalSpend ?? 0;
    if (!prev) return undefined;
    return ((last - prev) / Math.abs(prev)) * 100;
  }, [invoiceTrends]);

  const countDelta = useMemo(() => {
    const last = invoiceTrends.at(-1)?.invoiceCount ?? 0;
    const prev = invoiceTrends.at(-2)?.invoiceCount ?? 0;
    if (!prev) return undefined;
    return ((last - prev) / Math.abs(prev)) * 100;
  }, [invoiceTrends]);

  if (!stats) return <div className="p-6 text-lg font-medium">Loading dashboard...</div>;

  return (
    <div className="space-y-6 p-4">

      {/* Row 1 — KPI CARDS */}
      <div className="grid grid-cols-4 gap-4">
        <KpiCard
          title="Total Spend (YTD)"
          value={`€ ${stats.totalSpend.toLocaleString()}`}
          subtitle="Sum of all invoice totals this year"
          sparkData={spendSpark}
          trendDelta={spendDelta}
        />
        <KpiCard
          title="Total Invoices"
          value={stats.totalInvoices}
          subtitle="Count of invoices processed"
          sparkData={countSpark}
          trendDelta={countDelta}
        />
        <KpiCard
          title="Documents Uploaded"
          value={stats.documentsUploaded}
          subtitle="All documents in the system"
          sparkData={uploadedSpark}
        />
        <KpiCard
          title="Average Invoice Value"
          value={`€ ${Number(stats.averageInvoiceValue).toFixed(2)}`}
          subtitle="Mean value of invoices"
          sparkData={avgValueSpark}
        />
      </div>

      {/* Row 2 — LINE CHART + TOP VENDOR BAR */}
      <div className="grid grid-cols-2 gap-4">
        <Card className="h-[260px] p-4">
          <InvoiceTrendChart
            data={invoiceTrends}
            subtitle="Monthly invoice count and spend trend"
          />
        </Card>

        <Card className="h-[260px] p-4">
          <TopVendorsChart
            data={topVendors}
            subtitle="Top 10 vendors by total spend"
          />
        </Card>
      </div>

      {/* Row 3 — PIE + CASH OUTFLOW + TABLE */}
      <div className="grid grid-cols-3 gap-4">
        <Card className="h-[300px] p-4">
          <CategorySpendPieChart
            data={categorySpend}
            subtitle="Spend breakdown by category"
          />
        </Card>

        <Card className="h-[300px] p-4">
          <CashOutflowChart
            data={cashOutflow}
            subtitle="Projected payments by month"
          />
        </Card>

        <Card className="h-[300px] p-4 overflow-hidden">
          <InvoiceTable
            data={invoices}
            page={invoicePage}
            pages={invoicePagination.pages}
            onPageChange={setInvoicePage}
          />
        </Card>
      </div>
    </div>
  );
}

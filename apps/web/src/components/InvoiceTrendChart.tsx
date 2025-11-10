"use client";

import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  Tooltip,
  CartesianGrid,
  ResponsiveContainer,
  Legend,
} from "recharts";

type Props = { data: any[]; subtitle?: string };

export default function InvoiceTrendChart({ data, subtitle }: Props) {
  return (
    <div className="w-full h-full">
      <h2 className="text-sm font-medium">Invoice Volume & Spend</h2>
      {subtitle && <p className="text-[11px] text-gray-500 mb-2">{subtitle}</p>}

      <ResponsiveContainer width="100%" height="85%">
        <LineChart data={data}>
          <CartesianGrid strokeDasharray="3 3" stroke="#E5E7EB" />
          <XAxis dataKey="month" fontSize={10} />
          <YAxis fontSize={10} />
          <Tooltip />
          <Legend />
          <Line
            type="monotone"
            dataKey="invoiceCount"
            stroke="#2563eb"
            strokeWidth={2}
            dot={{ r: 2 }}
            activeDot={{ r: 4 }}
            name="Invoice Count"
          />
          <Line
            type="monotone"
            dataKey="totalSpend"
            stroke="#16a34a"
            strokeWidth={2}
            dot={{ r: 2 }}
            activeDot={{ r: 4 }}
            name="Total Spend (€)"
          />
        </LineChart>
      </ResponsiveContainer>
    </div>
  );
}

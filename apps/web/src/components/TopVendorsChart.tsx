"use client";

import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
} from "recharts";
import { useEffect, useState } from "react";

type Props = { data?: any[]; subtitle?: string };

export default function TopVendorsChart({ data: propData, subtitle }: Props) {
  const [data, setData] = useState<any[]>(propData ?? []);

  useEffect(() => {
    if (propData) return;
    fetch("http://localhost:4000/vendors/top10")
      .then((r) => r.json())
      .then(setData);
  }, [propData]);

  return (
    <div className="bg-white p-3 rounded-lg shadow-sm h-[220px] flex flex-col">
      <h2 className="text-sm font-medium">Top Vendors by Spend</h2>
      {subtitle && <p className="text-[11px] text-gray-500 mb-2">{subtitle}</p>}

      <ResponsiveContainer width="100%" height="80%">
        <BarChart data={data} layout="vertical">
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis type="number" />
          <YAxis dataKey="vendorName" type="category" width={180} />
          <Tooltip />
          <Bar dataKey="totalSpend" fill="#1d4ed8" radius={[0, 6, 6, 0]} />
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
}

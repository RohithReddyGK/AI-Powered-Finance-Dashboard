"use client";

import { useEffect, useState } from "react";
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from "recharts";

type Props = { data?: any[]; subtitle?: string };

export default function CashOutflowChart({ data: propData, subtitle }: Props) {
  const [data, setData] = useState<any[]>(propData ?? []);

  useEffect(() => {
    if (propData) return;
    fetch("http://localhost:4000/cash-outflow")
      .then((res) => res.json())
      .then(setData);
  }, [propData]);

  return (
    <div className="bg-white p-3 rounded-lg shadow-sm h-[300px] flex flex-col">
      <h2 className="text-sm font-medium">Cash Outflow Forecast</h2>
      {subtitle && <p className="text-[11px] text-gray-500 mb-2">{subtitle}</p>}

      <ResponsiveContainer width="100%" height={200}>
        <BarChart data={data}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="month" />
          <YAxis />
          <Tooltip />
          <Bar dataKey="projectedOutflow" fill="#9333ea" radius={[4, 4, 0, 0]} />
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
}

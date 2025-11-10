"use client";

import { useEffect, useState } from "react";
import { PieChart, Pie, Cell, Tooltip, ResponsiveContainer, Legend } from "recharts";

const COLORS = ["#2563eb", "#16a34a", "#f59e0b", "#dc2626", "#6b7280"];

type Props = { data?: any[]; subtitle?: string };

export default function CategorySpendPieChart({ data: propData, subtitle }: Props) {
  const [data, setData] = useState<any[]>(propData ?? []);

  useEffect(() => {
    if (propData) return;
    fetch("http://localhost:4000/category-spend")
      .then((res) => res.json())
      .then(setData);
  }, [propData]);

  return (
    <div className="bg-white p-3 rounded-lg shadow-sm h-[300px] flex flex-col">
      <h2 className="text-sm font-medium">Spend by Category</h2>
      {subtitle && <p className="text-[11px] text-gray-500 mb-2">{subtitle}</p>}

      <ResponsiveContainer width="100%" height={200}>
        <PieChart>
          <Pie
            data={data}
            dataKey="totalSpend"
            nameKey="category"
            cx="50%"
            cy="50%"
            outerRadius={90}
            label
          >
            {data.map((_: any, i: number) => (
              <Cell key={i} fill={COLORS[i % COLORS.length]} />
            ))}
          </Pie>
          <Tooltip />
          <Legend />
        </PieChart>
      </ResponsiveContainer>
    </div>
  );
}

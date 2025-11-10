"use client";

import {
  BarChart, Bar,
  LineChart, Line,
  XAxis, YAxis, Tooltip, CartesianGrid,
  ResponsiveContainer,
  PieChart, Pie, Cell, Legend
} from "recharts";

type Props = {
  columns: string[];
  rows: any[];
};

const COLORS = ["#2563eb", "#16a34a", "#f59e0b", "#dc2626", "#9333ea", "#0891b2"];

export default function AutoChart({ columns, rows }: Props) {
  if (!rows || rows.length === 0) return null;

  const numericCols = columns.filter(c => typeof rows[0][c] === "number");
  const textCols = columns.filter(c => typeof rows[0][c] === "string");

  const hasYear = columns.includes("year");
  const hasMonth = columns.includes("month");

  // CASE 1: Time-series (year + month) → Line chart, supports multiple numeric cols
  if (hasYear && hasMonth && numericCols.length >= 1) {
    const data = rows
      .map(r => ({
        ...r,
        date: new Date(r.year, r.month - 1, 1).getTime(),
      }))
      .sort((a, b) => a.date - b.date);

    return (
      <div className="h-72">
        <ResponsiveContainer width="100%" height="100%">
          <LineChart data={data}>
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="date"
              tickFormatter={(v) => {
                const d = new Date(v);
                return `${d.getFullYear()}-${String(d.getMonth()+1).padStart(2,"0")}`;
              }}
            />
            <YAxis />
            <Tooltip labelFormatter={(v) => new Date(v).toLocaleDateString()} />
            {numericCols.map((metric, i) => (
              <Line
                key={metric}
                type="monotone"
                dataKey={metric}
                stroke={COLORS[i % COLORS.length]}
                strokeWidth={2}
                dot={{ r: 4 }}
                activeDot={{ r: 6 }}
              />
            ))}
          </LineChart>
        </ResponsiveContainer>
      </div>
    );
  }

  // CASE 2: Small dataset + category → PIE CHART
  if (textCols.length === 1 && numericCols.length === 1 && rows.length <= 8) {
    const labelCol = textCols[0];
    const valueCol = numericCols[0];

    return (
      <div className="h-72 flex justify-center">
        <ResponsiveContainer width="90%" height="100%">
          <PieChart>
            <Pie
              data={rows}
              dataKey={valueCol}
              nameKey={labelCol}
              outerRadius={80}
              label
            >
              {rows.map((_, i) => (
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

  // CASE 3: Multi-category comparison → Bar Chart
  if (textCols.length >= 1 && numericCols.length >= 1) {
    const xKey = textCols[0];

    return (
      <div className="h-72">
        <ResponsiveContainer width="100%" height="100%">
          <BarChart data={rows}>
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey={xKey} />
            <YAxis />
            <Tooltip />
            {numericCols.map((metric, i) => (
              <Bar
                key={metric}
                dataKey={metric}
                fill={COLORS[i % COLORS.length]}
                radius={[4, 4, 0, 0]}
              />
            ))}
          </BarChart>
        </ResponsiveContainer>
      </div>
    );
  }

  // CASE 4: Single number → Show as KPI metric
  if (numericCols.length === 1 && rows.length === 1) {
    const val = rows[0][numericCols[0]];
    return (
      <div className="p-6 bg-white shadow rounded text-center">
        <p className="text-gray-500 text-sm">{numericCols[0]}</p>
        <p className="text-3xl font-bold">{val}</p>
      </div>
    );
  }

  return null;
}

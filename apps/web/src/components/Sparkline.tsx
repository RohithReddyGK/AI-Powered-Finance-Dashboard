"use client";

import { ResponsiveContainer, AreaChart, Area } from "recharts";

type SparklineProps = {
  data: { x: string | number; y: number }[];
};

export default function Sparkline({ data }: SparklineProps) {
  return (
    <div className="h-10 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <AreaChart data={data}>
          <Area
            type="monotone"
            dataKey="y"
            stroke="#6366f1"
            fill="#6366f1"
            fillOpacity={0.15}
            strokeWidth={2}
          />
        </AreaChart>
      </ResponsiveContainer>
    </div>
  );
}

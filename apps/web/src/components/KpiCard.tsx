"use client";

import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import Sparkline from "./Sparkline";

type KpiCardProps = {
  title: string;
  value: string | number;
  subtitle?: string;                 
  sparkData?: { x: string | number; y: number }[]; 
  trendDelta?: number;               
};

export default function KpiCard({
  title,
  value,
  subtitle,
  sparkData = [],
  trendDelta,
}: KpiCardProps) {
  const isUp = (trendDelta ?? 0) >= 0;

  return (
    <Card className="bg-white shadow-sm rounded-lg p-3">
      <CardHeader className="py-2">
        <CardTitle className="text-xs text-gray-500">{title}</CardTitle>
      </CardHeader>

      <CardContent className="py-2">
        <div className="flex items-baseline gap-2">
          <p className="text-2xl font-semibold">{value}</p>
          {trendDelta !== undefined && (
            <span
              className={`text-xs px-2 py-0.5 rounded-full ${
                isUp ? "bg-emerald-50 text-emerald-700" : "bg-rose-50 text-rose-700"
              }`}
              title="Change vs previous period"
            >
              {isUp ? "▲" : "▼"} {Math.abs(trendDelta).toFixed(1)}%
            </span>
          )}
        </div>

        {subtitle && (
          <p className="text-[11px] text-gray-500 mt-1">{subtitle}</p>
        )}

        {/* sparkline */}
        {sparkData.length > 1 && (
          <div className="mt-2">
            <Sparkline data={sparkData} />
          </div>
        )}
      </CardContent>
    </Card>
  );
}

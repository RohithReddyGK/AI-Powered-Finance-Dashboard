"use client";

import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { useMemo, useState } from "react";

type Row = {
  id: string;
  vendorName: string;
  invoiceNo: string;
  date: string;
  totalAmount: number | string;
  status?: string;
};

type Props = {
  data: Row[];
  page?: number;
  pages?: number;
  onPageChange?: (p: number) => void;
};

export default function InvoiceTable({ data, page = 1, pages = 1, onPageChange }: Props) {
  const [search, setSearch] = useState("");

  const filtered = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return data;
    return data.filter(
      (r) =>
        r.vendorName.toLowerCase().includes(q) ||
        r.invoiceNo.toLowerCase().includes(q)
    );
  }, [data, search]);

  return (
    <div className="flex flex-col h-full">
      <div className="flex items-center justify-between mb-2">
        <h2 className="text-sm font-medium">Invoices</h2>
        <Input
          placeholder="Search vendor or invoice..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="h-8 text-xs max-w-[220px]"
        />
      </div>

      {/* Scrollable body */}
      <div className="overflow-y-auto flex-grow pr-1">
        <Table className="text-xs">
          <TableHeader>
            <TableRow>
              <TableHead>Vendor</TableHead>
              <TableHead>Invoice #</TableHead>
              <TableHead>Date</TableHead>
              <TableHead className="text-right">Amount (€)</TableHead>
              <TableHead>Status</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {filtered.map((row) => (
              <TableRow key={row.id}>
                <TableCell>{row.vendorName}</TableCell>
                <TableCell>{row.invoiceNo}</TableCell>
                <TableCell>{new Date(row.date).toLocaleDateString()}</TableCell>
                <TableCell className="text-right">
                  {typeof row.totalAmount === "number"
                    ? row.totalAmount.toFixed(2)
                    : row.totalAmount}
                </TableCell>
                <TableCell>{row.status ?? "-"}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>

      {/* Pagination (hooks to your /invoices?page=... backend) */}
      <div className="flex items-center justify-between mt-2">
        <Button
          size="sm"
          variant="outline"
          disabled={page <= 1 || !onPageChange}
          onClick={() => onPageChange && onPageChange(page - 1)}
        >
          Previous
        </Button>
        <span className="text-[11px] text-gray-600">
          Page {page} of {pages}
        </span>
        <Button
          size="sm"
          variant="outline"
          disabled={page >= pages || !onPageChange}
          onClick={() => onPageChange && onPageChange(page + 1)}
        >
          Next
        </Button>
      </div>
    </div>
  );
}

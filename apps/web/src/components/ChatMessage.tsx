"use client";

import Papa from "papaparse";
import { saveAs } from "file-saver";
import AutoChart from "./AutoCharts";

export default function ChatMessage({ message }: any) {
  const { question, sql, columns = [], rows = [], error } = message;

  const downloadCSV = () => {
    const csv = Papa.unparse({ fields: columns, data: rows });
    const blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
    saveAs(blob, "query_result.csv");
  };

  return (
    <div className="bg-white p-4 rounded-lg shadow-sm border space-y-4">
      <div className="text-sm text-gray-500">👨🏻‍💻 You asked:</div>
      <div className="font-semibold">{question}</div>

      {error && (
        <div className="text-red-600 font-semibold text-sm">
          ⚠️ Error: {error}
        </div>
      )}

      {!error && sql && (
        <details className="bg-gray-100 text-xs p-2 rounded cursor-pointer">
          <summary className="font-medium">🐘 Show SQL</summary>
          <pre className="mt-2">{sql}</pre>
        </details>
      )}

      {!error && rows.length > 0 && (
        <>
          <AutoChart columns={columns} rows={rows} />
          <div className="overflow-auto max-h-64 rounded border">
            <h3 className="font-medium">🤖AI Results from DB</h3>
            <table className="min-w-full text-xs">
              <thead className="bg-gray-200">
                <tr>
                  {columns.map((c: string) => (
                    <th key={c} className="px-2 py-1 text-left">{c}</th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {rows.map((r: any, i: number) => (
                  <tr key={i} className="border-t">
                    {columns.map((c: string) => (
                      <td key={c} className="px-2 py-1">{r[c]}</td>
                    ))}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          <button
            onClick={downloadCSV}
            className="text-xs px-3 py-1 rounded bg-indigo-600 text-white hover:bg-indigo-700"
          >
            Export CSV 📥
          </button>
        </>
      )}

      {!error && rows.length === 0 && sql && (
        <div className="text-sm text-gray-500">No data found.</div>
      )}
    </div>
  );
}

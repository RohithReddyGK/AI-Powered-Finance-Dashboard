"use client";

import { useState } from "react";
import ChatMessage from "@/components/ChatMessage";

export default function ChatPage() {
  const [question, setQuestion] = useState("");
  const [messages, setMessages] = useState<any[]>([]);
  const [loading, setLoading] = useState(false);

  async function ask() {
    if (!question.trim()) return;
    setLoading(true);

    try {
      const res = await fetch(`${process.env.NEXT_PUBLIC_API_BASE}/chat-with-data`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ question }),
      });

      let data;
      try {
        data = await res.json();
      } catch {
        data = { detail: "Server returned non-JSON response" };
      }

      console.log("RESPONSE →", data); // <=== ✅ you will see real error now

      if (!res.ok) {
        setMessages((prev) => [
          { question, error: data.detail || "SQL Error" },
          ...prev,
        ]);
      } else {
        setMessages((prev) => [
          {
            question,
            sql: data.sql,
            columns: data.columns ?? [],
            rows: data.rows ?? [],
          },
          ...prev,
        ]);
      }
    } catch (err) {
      console.log(err);
      setMessages((prev) => [
        { question, error: "Network or API error" },
        ...prev,
      ]);
    }

    setQuestion("");
    setLoading(false);
  }

  return (
    <div className="space-y-6 max-w-4xl mx-auto">
      <h2 className="text-xl font-semibold">🗪 Chat with Analytics Data</h2>

      <div className="flex gap-2">
        <input
          className="border px-3 py-2 rounded w-full text-sm"
          placeholder="Ask: e.g., Top vendors by spend"
          value={question}
          onChange={(e) => setQuestion(e.target.value)}
          onKeyDown={(e) => e.key === "Enter" && ask()}
        />
        <button
          className="bg-blue-200 text-black px-4 rounded hover:bg-blue-500 cursor-pointer"
          onClick={ask}
          disabled={loading}
        >
          {loading ? "Thinking..." : "🗣️Ask"}
        </button>
      </div>

      <div className="space-y-4">
        {messages.map((m, i) => (
          <ChatMessage key={i} message={m} />
        ))}
      </div>
    </div>
  );
}

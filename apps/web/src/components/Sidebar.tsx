"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils";

const navItems = [
  { name: "Dashboard", href: "/dashboard" },
  { name: "Chat with Data", href: "/dashboard/chat" },
];

export default function Sidebar({ collapsed, setCollapsed }: any) {
  const pathname = usePathname();

  return (
    <aside
      className={cn("h-screen border-r bg-white flex flex-col justify-between transition-all duration-300",
        collapsed ? "w-16" : "w-64"
      )}
    >

      <div>
        <button
          onClick={() => setCollapsed(!collapsed)}
          className="p-4 text-xl hover:bg-gray-100 w-full text-left"
        >
          ☰
        </button>

        <nav className="px-2 space-y-1">
          {navItems.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className={cn(
                "flex items-center gap-2 p-2 rounded text-sm font-medium hover:bg-gray-100 transition",
                pathname === item.href ? "bg-gray-200 text-black" : "text-gray-600"
              )}
            >
              {!collapsed && item.name}
            </Link>
          ))}
        </nav>
      </div>

      <div className="p-4 font-medium text-black-500">
        <a className="hover:text-blue-600"
          href="https://www.flowbitai.com/en"
          target="_blank"
        >
          ⚡{!collapsed && "Flowbit AI"}
        </a>
      </div>
    </aside>
  );
}

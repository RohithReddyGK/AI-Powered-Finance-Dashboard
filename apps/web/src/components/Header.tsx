import { Avatar } from "@/components/ui/avatar";

export default function Header() {
  return (
    <header className="flex justify-between items-center px-6 py-3 border-b bg-white">
      <h1 className="text-lg font-semibold">Dashboard - Analytics-Test-Data</h1>

      <div className="flex items-center gap-3">
        <div className="text-right text-sm leading-tight">
          <div className="text-gray-500 font-bold">By - </div>
          <div className="font-medium">Rohith Reddy G K</div>
        </div>
        <Avatar />
      </div>
    </header>
  );
}

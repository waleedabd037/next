// app/cancel/page.tsx
import Link from "next/link";

export default function CancelPage() {
  return (
    <div className="min-h-screen flex flex-col justify-center items-center p-6">
      <h1 className="text-3xl font-bold text-red-600 mb-4">Payment Cancelled</h1>
      <p className="text-lg mb-6 text-center">
        It looks like you cancelled the checkout process. No payment was made.
      </p>
      <Link href="/checkout" className="text-blue-500 underline">
        Try Again
      </Link>
    </div>
  );
}

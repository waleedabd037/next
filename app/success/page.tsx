// app/success/page.tsx
import Link from "next/link";

export default function SuccessPage() {
  return (
    <div className="min-h-screen flex flex-col justify-center items-center p-6">
      <h1 className="text-3xl font-bold text-green-600 mb-4">Payment Successful!</h1>
      <p className="text-lg mb-6 text-center">
        Thank you for your purchase. Your order has been placed successfully.
      </p>
      <Link href="/" className="text-blue-500 underline">
        Back to Home
      </Link>
    </div>
  );
}

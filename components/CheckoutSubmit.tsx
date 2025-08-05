"use client";

const CheckoutSubmit = ({ onSubmit }: { onSubmit: () => void }) => (
  <div className="mt-10 border-t border-gray-200 pt-6 ml-0">
    <button
      type="button"
      onClick={onSubmit}
      className="w-full rounded-md border border-transparent bg-blue-500 px-20 py-2 text-lg font-medium text-white shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 focus:ring-offset-gray-50 sm:order-last"
    >
      Pay Now
    </button>
  </div>
);

export default CheckoutSubmit;

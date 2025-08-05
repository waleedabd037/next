"use client";

const PaymentForm = ({ form, setForm }: any) => (
  <section aria-labelledby="payment-heading" className="mt-10">
    <h2 id="payment-heading" className="text-lg font-medium text-gray-900">
      Payment details
    </h2>
    <div className="mt-6 grid grid-cols-3 gap-x-4 gap-y-6 sm:grid-cols-4">
      {[
        { id: "cardName", label: "Name on card", span: "col-span-3 sm:col-span-4" },
        { id: "cardNumber", label: "Card number", span: "col-span-3 sm:col-span-4" },
        { id: "expirationDate", label: "Expiration date (MM/YY)", span: "col-span-2 sm:col-span-3" },
        { id: "cvc", label: "CVC or CVV", span: "" },
      ].map(({ id, label, span }) => (
        <div key={id} className={span}>
          <label htmlFor={id} className="block text-sm font-medium text-gray-700">
            {label}
          </label>
          <div className="mt-1">
            <input
              type="text"
              id={id}
              name={id}
              autoComplete="off"
              className="block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
              value={form[id]}
              onChange={(e) => setForm({ ...form, [id]: e.target.value })}
            />
          </div>
        </div>
      ))}
    </div>
  </section>
);

export default PaymentForm;

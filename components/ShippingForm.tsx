"use client";

const ShippingForm = ({ form, setForm }: any) => (
  <section aria-labelledby="shipping-heading" className="mt-10">
    <h2 id="shipping-heading" className="text-lg font-medium text-gray-900">Shipping address</h2>
    <div className="mt-6 grid grid-cols-1 gap-x-4 gap-y-6 sm:grid-cols-3">
      {[
        { id: "company", label: "Company", span: "sm:col-span-3" },
        { id: "adress", label: "Address", span: "sm:col-span-3" },
        { id: "apartment", label: "Apartment, suite, etc.", span: "sm:col-span-3" },
        { id: "city", label: "City" },
        { id: "country", label: "Country" },
        { id: "postalCode", label: "Postal code" },
        { id: "orderNotice", label: "Order notice", textarea: true, span: "sm:col-span-3" },
      ].map(({ id, label, textarea, span }) => (
        <div key={id} className={span}>
          <label htmlFor={id} className="block text-sm font-medium text-gray-700">{label}</label>
          <div className="mt-1">
            {textarea ? (
              <textarea
                id={id}
                name={id}
                className="textarea textarea-bordered textarea-lg w-full"
                value={form[id]}
                onChange={(e) => setForm({ ...form, [id]: e.target.value })}
              />
            ) : (
              <input
                type="text"
                id={id}
                name={id}
                className="block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
                value={form[id]}
                onChange={(e) => setForm({ ...form, [id]: e.target.value })}
              />
            )}
          </div>
        </div>
      ))}
    </div>
  </section>
);

export default ShippingForm;

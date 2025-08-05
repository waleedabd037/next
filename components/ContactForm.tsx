"use client";

const ContactForm = ({ form, setForm }: any) => (
  <section aria-labelledby="contact-info-heading">
    <h2 id="contact-info-heading" className="text-lg font-medium text-gray-900">
      Contact information
    </h2>
    {["name", "lastname", "phone", "email"].map((field) => (
      <div className="mt-6" key={field}>
        <label htmlFor={`${field}-input`} className="block text-sm font-medium text-gray-700">
          {field[0].toUpperCase() + field.slice(1).replace("name", "Name")}
        </label>
        <div className="mt-1">
          <input
            type={field === "email" ? "email" : "text"}
            id={`${field}-input`}
            name={`${field}-input`}
            autoComplete="text"
            className="block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm"
            value={form[field]}
            onChange={(e) => setForm({ ...form, [field]: e.target.value })}
          />
        </div>
      </div>
    ))}
  </section>
);

export default ContactForm;

// app/checkout/page.tsx
"use client";

import React, { useEffect } from "react";
import { useRouter } from "next/navigation";
import toast from "react-hot-toast";
import { useProductStore } from "../_zustand/store"; // ✅ correct hook
import SectionTitle from "@/components/SectionTitle";
import OrderSummary from "@/components/OrderSummary";
import ContactForm from "@/components/ContactForm";
import PaymentForm from "@/components/PaymentForm";
import ShippingForm from "@/components/ShippingForm";
import CheckoutSubmit from "@/components/CheckoutSubmit";

const CheckoutPage = () => {
  const router = useRouter();
  const { products, total } = useProductStore((state) => ({
    products: state.products,
    total: state.total,
  }));

  const [checkoutForm, setCheckoutForm] = React.useState({
    name: "",
    lastname: "",
    phone: "",
    email: "",
    cardName: "",
    cardNumber: "",
    expirationDate: "",
    cvc: "",
    company: "",
    adress: "",
    apartment: "",
    city: "",
    country: "",
    postalCode: "",
    orderNotice: "",
  });

  useEffect(() => {
    if (products.length === 0) {
      toast.error("You don't have items in your cart");
      router.push("/cart");
    }
  }, [products, router]);

  const makePurchase = () => {
    // Existing makePurchase logic...
  };

  return (
    <div className="bg-white">
      <SectionTitle title="Checkout" path="Home | Cart | Checkout" />

      <main className="relative mx-auto grid max-w-screen-2xl grid-cols-1 gap-x-16 lg:grid-cols-2 lg:px-8 xl:gap-x-48">
        <section
          aria-labelledby="summary-heading"
          className="bg-gray-50 px-4 pb-10 pt-16 sm:px-6 lg:col-start-2 lg:row-start-1 lg:bg-transparent lg:px-0 lg:pb-16"
        >
          <OrderSummary products={products} total={total} />
        </section>

        <form className="px-4 pt-16 sm:px-6 lg:col-start-1 lg:row-start-1 lg:px-0">
          <div className="mx-auto max-w-lg lg:max-w-none">
            <ContactForm form={checkoutForm} setForm={setCheckoutForm} />
            <PaymentForm form={checkoutForm} setForm={setCheckoutForm} />
            <ShippingForm form={checkoutForm} setForm={setCheckoutForm} />
            <CheckoutSubmit onSubmit={makePurchase} />
          </div>
        </form>
      </main>
    </div>
  );
};

export default CheckoutPage;

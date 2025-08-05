"use client";

import React, { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import toast from "react-hot-toast";
import { useProductStore } from "../_zustand/store";
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

  const [checkoutForm, setCheckoutForm] = useState({
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

  const makePurchase = async () => {
    try {
      const res = await fetch("/api/checkout", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          products, // ✅ Match backend
          formData: checkoutForm,
        }),
      });

      const data = await res.json();

      if (data?.url) {
        window.location.href = data.url; // ✅ Redirect to Stripe
      } else {
        toast.error("Failed to redirect to Stripe Checkout");
      }
    } catch (error) {
      console.error("Checkout error:", error);
      toast.error("Checkout failed");
    }
  };

  return (
    <div className="bg-white">
      <SectionTitle title="Checkout" path="Home | Cart | Checkout" />

      <main className="relative mx-auto grid max-w-screen-2xl grid-cols-1 gap-x-16 lg:grid-cols-2 lg:px-8 xl:gap-x-48">
        {/* Order Summary Section */}
        <section
          aria-labelledby="summary-heading"
          className="bg-gray-50 px-4 pb-10 pt-16 sm:px-6 lg:col-start-2 lg:row-start-1 lg:bg-transparent lg:px-0 lg:pb-16"
        >
          <OrderSummary products={products} total={total} />
        </section>

        {/* Checkout Forms */}
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

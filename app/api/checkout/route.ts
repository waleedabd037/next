import { NextRequest, NextResponse } from "next/server";
import Stripe from "stripe";

// Stripe setup
const stripe = new Stripe(process.env.STRIPE_SECRET_KEY as string, {
  apiVersion: "2025-07-30.basil",
});

export async function POST(req: NextRequest) {
  try {
    const body = await req.json();

    const products = body.products;

    if (!products || !Array.isArray(products)) {
      return NextResponse.json({ error: "Invalid products data" }, { status: 400 });
    }

    const session = await stripe.checkout.sessions.create({
      payment_method_types: ["card"],
        mode: "payment",
      success_url: `${process.env.NEXTAUTH_URL}/success`, // ✅ Must include http/https
      cancel_url: `${process.env.NEXTAUTH_URL}/cancel`,
      line_items: products.map((product: any) => ({
        price_data: {
          currency: "usd",
          product_data: {
            name: product.title,
            images: product.mainImage ? [product.mainImage] : [],
          },
          unit_amount: Math.round(product.price * 100), // Stripe requires amount in cents
        },
        quantity: product.quantity || 1, // ✅ FIX: quantity is required
      })),
    });

    return NextResponse.json({ url: session.url });
  } catch (error: any) {
    console.error("❌ Stripe Checkout Error:", error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}

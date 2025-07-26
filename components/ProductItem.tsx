"use client"
import Image from "next/image";
import React, { useState, useEffect } from "react";
import Link from "next/link";
import { useSession } from "next-auth/react"; // Import useSession from next-auth

// Define the Product type with only the properties you need
type Product = {
  id: string;
  slug: string;
  title: string;
  mainImage: string;
  price: number;
  rating: number;
};

const ProductItem = ({
  product,
  color,
}: {
  product: Product;
  color: string;
}) => {
  const [hasInteracted, setHasInteracted] = useState(false);
  const { data: session, status } = useSession(); // Get session data

  useEffect(() => {
    // You can handle side effects like logging or updating state here
    if (session?.user?.id) {
      console.log("User ID from session:", session.user.id); // Log the user ID if available
    }
  }, [session]); // Runs when session changes

  const handleUserInteraction = async (interactionType: string) => {
    if (hasInteracted) return; // Prevent sending multiple interactions

    setHasInteracted(true);

    try {
      if (!session?.user?.id) {
        console.error("User is not authenticated");
        return;
      }

      const userId = session.user.id; // Get user ID from session

      const response = await fetch("/api/user-interaction", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          userId,
          productId: product.id,
          interactionType, // Example: "view" or "click"
        }),
      });

      if (response.ok) {
        const data = await response.json();
        console.log("Interaction saved:", data);
      } else {
        console.error("Failed to save interaction");
      }
    } catch (error) {
      console.error("Error sending interaction:", error);
    }
  };

  return (
    <div className="flex flex-col items-center gap-y-2">
      <Link href={`/product/${product.slug}`}>
        <Image
          src={product.mainImage ? `/${product.mainImage}` : "/product_placeholder.jpg"}
          width="0"
          height="0"
          sizes="100vw"
          className="w-auto h-[300px]"
          alt={product.title}
          onClick={() => handleUserInteraction("click")} // Track when the product is clicked
        />
      </Link>
      <Link
        href={`/product/${product.slug}`}
        className={color === "black" ? "text-xl text-black font-normal mt-2 uppercase" : "text-xl text-white font-normal mt-2 uppercase"}
        onClick={() => handleUserInteraction("click")} // Track when the product link is clicked
      >
        {product.title}
      </Link>
      <p className={color === "black" ? "text-lg text-black font-semibold" : "text-lg text-white font-semibold"}>${product.price}</p>

      <Link
        href={`/product/${product.slug}`}
        className="block flex justify-center items-center w-1/2 uppercase bg-white px-0 py-2 text-base border border-black border-gray-300 font-bold text-black shadow-sm hover:bg-black hover:bg-gray-100 focus:outline-none focus:ring-2"
        onClick={() => handleUserInteraction("view")} // Track when the "View product" button is clicked
      >
        <p>Buy Product</p>
      </Link>
    </div>
  );
};

export default ProductItem;

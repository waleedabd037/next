"use client";
import React, { useEffect, useState } from "react";
import WishItem from "@/components/WishItem";

type WishlistItemProps = {
  id: string;
  title: string;
  price: number;
  slug: string;
  stockAvailabillity: boolean | number ;
};

export default function WishlistItemWithImage({
  id,
  title,
  price,
  slug,
  stockAvailabillity,
}: WishlistItemProps) {
  const [mainImage, setMainImage] = useState<string | null>(null);

  useEffect(() => {
    async function fetchMainImage() {
      try {
        const res = await fetch(`/api/products/${slug}`);
        const data = await res.json();
        setMainImage(data?.mainImage || null);
      } catch (err) {
        console.error("Error fetching main image:", err);
      }
    }

    fetchMainImage();
  }, [slug]);

  return (
    <WishItem
      id={id}
      title={title}
      price={price}
      image={mainImage || "/placeholder.png"}
      mainImage={mainImage || "/placeholder.png"}
      slug={slug}
      stockAvailabillity={stockAvailabillity}
    />
  );
}
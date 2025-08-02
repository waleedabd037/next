"use client";

import { useWishlistStore } from "@/app/_zustand/wishlistStore";
import { useSession } from "next-auth/react";
import React, { useEffect, useState } from "react";
import toast from "react-hot-toast";
import { FaHeartCrack } from "react-icons/fa6";
import { FaHeart } from "react-icons/fa6";
import { apiBaseUrl } from "@/lib/constants";

interface AddToWishlistBtnProps {
  product: Product;
  slug: string;
}

const AddToWishlistBtn = ({ product, slug }: AddToWishlistBtnProps) => {
  const { data: session, status } = useSession();
  const { addToWishlist, removeFromWishlist, wishlist } = useWishlistStore();
  const [isProductInWishlist, setIsProductInWishlist] = useState<boolean>();

  const addToWishlistFun = async () => {
    if (session?.user?.email) {
      fetch(`${apiBaseUrl}/api/users/email/${session?.user?.email}`, {
        cache: "no-store",
      })
        .then((response) => response.json())
        .then((data) =>
          fetch(`${apiBaseUrl}/api/wishlist`, {
            method: "POST",
            headers: {
              Accept: "application/json, text/plain, */*",
              "Content-Type": "application/json",
            },
            body: JSON.stringify({ productId: product?.id, userId: data?.id }),
          })
            .then((response) => response.json())
            .then(() => {
              addToWishlist({
                id: product?.id,
                title: product?.title,
                price: product?.price,
                image: product?.mainImage,
                slug: product?.slug,
                stockAvailabillity: product?.inStock,
              });
              toast.success("Product added to the wishlist");
            })
        );
    } else {
      toast.error("You need to be logged in to add a product to the wishlist");
    }
  };

  const removeFromWishlistFun = async () => {
    if (session?.user?.email) {
      fetch(`${apiBaseUrl}/api/users/email/${session?.user?.email}`, {
        cache: "no-store",
      })
        .then((response) => response.json())
        .then((data) =>
          fetch(`${apiBaseUrl}/api/wishlist/${data?.id}/${product?.id}`, {
            method: "DELETE",
          })
        )
        .then(() => {
          removeFromWishlist(product?.id);
          toast.success("Product removed from the wishlist");
        });
    }
  };

  const isInWishlist = async () => {
    if (session?.user?.email) {
      fetch(`${apiBaseUrl}/api/users/email/${session?.user?.email}`, {
        cache: "no-store",
      })
        .then((response) => response.json())
        .then((data) =>
          fetch(`${apiBaseUrl}/api/wishlist/${data?.id}/${product?.id}`)
        )
        .then((response) => response.json())
        .then((data) => {
          setIsProductInWishlist(!!data[0]?.id);
        });
    }
  };

  useEffect(() => {
    isInWishlist();
  }, [session?.user?.email, wishlist]);

  return (
    <>
      {isProductInWishlist ? (
        <p
          className="flex items-center gap-x-2 cursor-pointer"
          onClick={removeFromWishlistFun}
        >
          <FaHeartCrack className="text-xl text-custom-black" />
          <span className="text-lg">REMOVE FROM WISHLIST</span>
        </p>
      ) : (
        <p
          className="flex items-center gap-x-2 cursor-pointer"
          onClick={addToWishlistFun}
        >
          <FaHeart className="text-xl text-custom-black" />
          <span className="text-lg">ADD TO WISHLIST</span>
        </p>
      )}
    </>
  );
};

export default AddToWishlistBtn;

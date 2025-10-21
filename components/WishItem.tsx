"use client";
import { useWishlistStore } from "@/app/_zustand/wishlistStore";
import Image from "next/image";
import { useRouter } from "next/navigation";
import toast from "react-hot-toast";
import { FaHeartCrack } from "react-icons/fa6";
import { useSession } from "next-auth/react";
import { apiBaseUrl } from "@/lib/constants";
import React, { useEffect, useState } from "react";

const WishItem = ({
  id,
  title,
  price,
  image,
  mainImage,
  slug,
  stockAvailabillity,
}: ProductInWishlist) => {
  const { data: session } = useSession();
  const { removeFromWishlist } = useWishlistStore();
  const router = useRouter();
  const [userId, setUserId] = useState<string>();

  const getUserByEmail = async () => {
    if (session?.user?.email) {
      const res = await fetch(`${apiBaseUrl}/api/users/email/${session.user.email}`, {
        cache: "no-store",
      });
      const data = await res.json();
      setUserId(data?.id);
    }
  };

  const deleteItemFromWishlist = async (productId: string) => {
    if (userId) {
      await fetch(`${apiBaseUrl}/api/wishlist/${userId}/${productId}`, {
        method: "DELETE",
      });
      removeFromWishlist(productId);
      toast.success("Item removed from your wishlist");
    } else {
      toast.error("You need to be logged in to perform this action");
    }
  };

  useEffect(() => {
    getUserByEmail();
  }, [session?.user?.email]);

  return (
    <tr className="hover:bg-gray-50 transition">
      <td className="py-3 text-sm text-gray-700">{id}</td>
      <td>
        <div className="flex justify-center">
          <Image
            src={mainImage}
            width={50}
            height={50}
            alt={title}
            className="rounded-md object-cover cursor-pointer"
            onClick={() => router.push(`/product/${slug}`)}
          />
        </div>
      </td>
      <td
        className="text-gray-800 font-medium cursor-pointer"
        onClick={() => router.push(`/product/${slug}`)}
      >
        {title}
      </td>
      <td>
        {stockAvailabillity ? (
          <span className="px-2 py-1 text-xs rounded bg-green-100 text-green-600 font-semibold">
            In stock
          </span>
        ) : (
          <span className="px-2 py-1 text-xs rounded bg-red-100 text-red-600 font-semibold">
            Out of stock
          </span>
        )}
      </td>
      <td>
        <button
          onClick={() => deleteItemFromWishlist(id)}
          className="flex items-center gap-1 px-3 py-1 text-sm bg-red-500 hover:bg-red-600 text-white rounded-md transition"
        >
          <FaHeartCrack />
          <span className="hidden sm:inline">Remove</span>
        </button>
      </td>
    </tr>
  );
};

export default WishItem;
"use client";
import { SectionTitle, WishItem } from "@/components";
import React, { useEffect, useState } from "react";
import { useWishlistStore } from "../_zustand/wishlistStore";
import { nanoid } from "nanoid";
import { useSession } from "next-auth/react";
import { apiBaseUrl } from "@/lib/constants";

export default function WishlistPage() {
  const { data: session } = useSession();
  const { wishlist, setWishlist } = useWishlistStore();
  const [loading, setLoading] = useState(true);

  // Fetch wishlist by user ID
  const getWishlistByUserId = async (id: string) => {
    try {
      const res = await fetch(`${apiBaseUrl}/api/wishlist/${id}`, {
        cache: "no-store",
      });
      const data = await res.json();

      const productArray = data?.map((item: any) => ({
        id: item?.product?.id,
        title: item?.product?.title,
        price: item?.product?.price,
        image: item?.product?.mainImage,
        mainImage: item?.product?.mainImage,
        slug: item?.product?.slug,
        stockAvailabillity: item?.product?.inStock,
      }));

      setWishlist(productArray || []);
    } catch (err) {
      console.error("Error fetching wishlist:", err);
    } finally {
      setLoading(false);
    }
  };

  // Get user by email, then fetch their wishlist
  const getUserByEmail = async () => {
    if (session?.user?.email) {
      try {
        const res = await fetch(
          `${apiBaseUrl}/api/users/email/${session.user.email}`,
          { cache: "no-store" }
        );
        const user = await res.json();
        if (user?.id) {
          await getWishlistByUserId(user.id);
        } else {
          setLoading(false);
        }
      } catch (err) {
        console.error("Error fetching user:", err);
        setLoading(false);
      }
    } else {
      setLoading(false);
    }
  };

  useEffect(() => {
    getUserByEmail();
  }, [session?.user?.email]);

  if (loading) {
    return (
      <div className="text-center py-10 text-gray-500 text-lg">
        Loading wishlist...
      </div>
    );
  }

  return (
    <div className="bg-white min-h-screen py-8">
      <SectionTitle title="Wishlist" path="Home | Wishlist" />
      {wishlist.length === 0 ? (
        <h3 className="text-center text-3xl font-semibold py-10 text-gray-700">
          No items found in the wishlist
        </h3>
      ) : (
        <div className="max-w-screen-2xl mx-auto">
          <div className="overflow-x-auto shadow-md rounded-lg">
            <table className="table w-full text-center border">
              <thead className="bg-gray-100">
                <tr>
                  <th className="text-gray-700 font-semibold">#</th>
                  <th className="text-gray-700 font-semibold">Image</th>
                  <th className="text-gray-700 font-semibold">Name</th>
                  <th className="text-gray-700 font-semibold">Stock Status</th>
                  <th className="text-gray-700 font-semibold">Action</th>
                </tr>
              </thead>
              <tbody>
                {wishlist.map((item, index) => (
                  <WishItem
                    id={item.id}
                    title={item.title}
                    price={item.price}
                    image={item.image}
                    mainImage={item.mainImage}
                    slug={item.slug}
                    stockAvailabillity={item.stockAvailabillity}
                    key={nanoid()}
                  />
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}
    </div>
  );
}

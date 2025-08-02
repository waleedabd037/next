"use client";
import { usePathname } from "next/navigation";
import React, { useEffect, useState } from "react";
import HeaderTop from "./HeaderTop";
import Image from "next/image";
import SearchInput from "./SearchInput";
import Link from "next/link";
import { FaBell } from "react-icons/fa6";
import CartElement from "./CartElement";
import HeartElement from "./HeartElement";
import { signOut, useSession } from "next-auth/react";
import toast from "react-hot-toast";
import { useWishlistStore } from "@/app/_zustand/wishlistStore";
import { apiBaseUrl } from "@/lib/constants"; // ✅ import added

const Header = () => {
    const { data: session, status } = useSession();
    const pathname = usePathname();
    const { wishlist, setWishlist, wishQuantity } = useWishlistStore();

    const handleLogout = () => {
        setTimeout(() => signOut(), 1000);
        toast.success("Logout successful!");
    };

    // getting all wishlist items by user id
    const getWishlistByUserId = async (id: string) => {
        const response = await fetch(`${apiBaseUrl}/api/wishlist/${id}`, {
            cache: "no-store",
        });
        const wishlist = await response.json();
        const productArray: {
            id: string;
            title: string;
            price: number;
            image: string;
            slug: string;
            stockAvailabillity: number;
        }[] = [];

        wishlist.map((item: any) =>
            productArray.push({
                id: item?.product?.id,
                title: item?.product?.title,
                price: item?.product?.price,
                image: item?.product?.mainImage,
                slug: item?.product?.slug,
                stockAvailabillity: item?.product?.inStock,
            })
        );

        setWishlist(productArray);
    };

    // getting user by email so I can get his user id
    const getUserByEmail = async () => {
        if (session?.user?.email) {
            fetch(`${apiBaseUrl}/api/users/email/${session?.user?.email}`, {
                cache: "no-store",
            })
                .then((response) => response.json())
                .then((data) => {
                    getWishlistByUserId(data?.id);
                });
        }
    };

    useEffect(() => {
        getUserByEmail();
    }, [session?.user?.email, wishlist.length]);

    return (
        <header className="bg-white">
            <div className="fixed top-0 left-0 w-full z-40">
                <HeaderTop />
            </div>

            <div className="h-10"></div>

            {pathname.startsWith("/admin") === false && (
                <div className="h-32 bg-white flex items-center justify-between px-16 max-[1320px]:px-16 max-md:px-6 max-lg:flex-col max-lg:gap-y-7 max-lg:justify-center max-lg:h-50 max-w-screen-2xl mx-auto">
                    <SearchInput />
                    <div className="flex gap-x-10">
                        <HeartElement wishQuantity={wishQuantity} />
                        <CartElement />
                    </div>
                </div>
            )}

            {pathname.startsWith("/dashboard") === true && (
                <div className="flex justify-between h-32 bg-white items-center px-16 max-[1320px]:px-10 max-w-screen-2xl mx-auto max-[400px]:px-5">
                    <div className="flex gap-x-5 items-center">
                        <FaBell className="text-xl" />
                        <div className="dropdown dropdown-end">
                            <div tabIndex={0} role="button" className="w-10">
                                <Image
                                    src="/randomuser.jpg"
                                    alt="random profile photo"
                                    width={30}
                                    height={30}
                                    className="w-full h-full rounded-full"
                                />
                            </div>
                            <ul
                                tabIndex={0}
                                className="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52"
                            >
                                <li>
                                    <Link href="/admin">Dashboard</Link>
                                </li>
                                <li>
                                    <a>Profile</a>
                                </li>
                                <li onClick={handleLogout}>
                                    <a href="#">Logout</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            )}
        </header>
    );
};

export default Header;

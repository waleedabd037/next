"use client";

import { signOut, useSession } from "next-auth/react";
import Link from "next/link";
import React from "react";
import toast from "react-hot-toast";
import { FaRegUser } from "react-icons/fa6";

const HeaderTop = () => {
    const { data: session }: any = useSession();

    const handleLogout = () => {
        toast.success("Logout successful!");
        signOut();
    };

    return (
        <div className="h-16 text-white bg-[#020617] max-lg:px-5 max-lg:h-16 max-[573px]:px-0 fixed top-0 w-full z-40">
            <div className="flex justify-between h-full max-lg:flex-col max-lg:justify-center max-lg:items-center max-w-screen-2xl mx-auto px-12 max-[573px]:px-0">
                <ul className="flex items-center h-full gap-x-5 max-[370px]:text-sm max-[370px]:gap-x-2">
                    <li className="flex items-center gap-x-2 font-semibold">
                        <Link href="/">
                            <img
                                src="https://gtvytcgrhrelhbwogyoe.supabase.co/storage/v1/object/public/product-images//logo%20v1%20svg.svg"
                                width={50}
                                height={300}
                                alt="kia logo"
                                className="relative right-5 max-[1023px]:w-56"
                            />
                        </Link>
                    </li>
                    <li>
                        <a href="#" className="hover:text-cyan-400">
                            Vehicles
                        </a>
                    </li>
                    <li>
                        <a href="#" className="hover:text-cyan-400">
                            Shopping Assist
                        </a>
                    </li>
                    <li>
                        <a href="#" className="hover:text-cyan-400">
                            Inventory
                        </a>
                    </li>
                    <li>
                        <a href="#" className="hover:text-cyan-400">
                            Kia Innovation
                        </a>
                    </li>
                    <li>
                        <a href="#" className="hover:text-cyan-400">
                            Owners
                        </a>
                    </li>
                </ul>

                <ul className="flex items-center gap-x-5 h-full max-[370px]:text-sm max-[370px]:gap-x-2 font-semibold">
                    {!session ? (
                        <>
                            <li className="flex items-center">
                                <Link href="/login" className="flex items-center gap-x-2 font-semibold">
                                    <FaRegUser className="text-white" />
                                    <span>Login</span>
                                </Link>
                            </li>
                            <li className="flex items-center">
                                <Link href="/register" className="flex items-center gap-x-2 font-semibold">
                                    <FaRegUser className="text-white" />
                                    <span>Register</span>
                                </Link>
                            </li>
                        </>
                    ) : (
                        <>
                            <span className="ml-10 text-base">{session.user?.email}</span>
                            <li className="flex items-center">
                                <button
                                    onClick={handleLogout}
                                    className="flex items-center gap-x-2 font-semibold"
                                >
                                    <FaRegUser className="text-white" />
                                    <span>Log out</span>
                                </button>
                            </li>
                        </>
                    )}
                </ul>
            </div>
        </div>
    );
};

export default HeaderTop;

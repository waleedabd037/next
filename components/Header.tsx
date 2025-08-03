"use client";

import { usePathname } from "next/navigation";
import React from "react";
import HeaderTop from "./HeaderTop";
import SearchInput from "./SearchInput";
import HeartElement from "./HeartElement";
import CartElement from "./CartElement";
import { useSession, signOut } from "next-auth/react";
import toast from "react-hot-toast";

const Header = () => {
    const { data: session } = useSession();
    const pathname = usePathname();

    const handleLogout = () => {
        setTimeout(() => signOut(), 1000);
        toast.success("Logout successful!");
    };

    return (
        <header className="bg-white">
            {/* Top Bar */}
            <div className="fixed top-0 left-0 w-full z-40">
                <HeaderTop />
            </div>

            {/* Spacer */}
            <div className="h-10"></div>

            {/* Main Search and Icons */}
            {!pathname.startsWith("/admin") && (
                <div className="h-32 bg-white flex items-center justify-between px-16 max-[1320px]:px-16 max-md:px-6 max-lg:flex-col max-lg:gap-y-7 max-lg:justify-center max-lg:h-50 max-w-screen-2xl mx-auto">
                    <SearchInput />
                    <div className="flex gap-x-10">
                        <HeartElement wishQuantity={0} /> {/* Placeholder 0 */}
                        <CartElement />
                    </div>
                </div>
            )}

            {/* Dashboard Header (No Dropdowns) */}
            {pathname.startsWith("/dashboard") && (
                <div className="flex justify-between h-32 bg-white items-center px-16 max-[1320px]:px-10 max-w-screen-2xl mx-auto max-[400px]:px-5">
                    <div className="text-base font-medium">
                        Welcome, {session?.user?.email}
                    </div>
                    <button
                        onClick={handleLogout}
                        className="text-sm font-medium text-white bg-red-500 px-4 py-2 rounded-md hover:bg-red-600"
                    >
                        Logout
                    </button>
                </div>
            )}
        </header>
    );
};

export default Header;

"use client";
import { SectionTitle } from "@/components";
import { useState } from "react";
import AdminLogin from "@/components/AdminLogin";
import UserLogin from "@/components/UserLogin";
import AdminIcon from "@/components/AdminIcon";
import UserIcon from "@/components/UserIcon";

const LoginPage = () => {
    const [accountType, setAccountType] = useState<"user" | "admin">("user");

    return (
        <div className="bg-blue-50 min-h-screen flex flex-col items-center justify-center p-4">
            {/* Section Title */}

            {/* Login Card */}
            <div className="w-full max-w-md bg-white p-6 rounded-md shadow-lg">
                <h2 className="text-center text-2xl font-semibold text-gray-900 mb-4">
                    Choose Account Type
                </h2>

                {/* Account Type Selection */}
                <div className="flex justify-around mb-6">
                    <div
                        onClick={() => setAccountType("user")}
                        className={`flex flex-col items-center cursor-pointer p-4 rounded-md border-2 ${
                            accountType === "user"
                                ? "border-blue-500"
                                : "border-gray-200"
                        }`}
                    >
                        {/* User Icon */}
                        <UserIcon />
                        <span
                            className={`text-sm font-medium ${
                                accountType === "user"
                                    ? "text-blue-500"
                                    : "text-gray-700"
                            }`}
                        >
                            User
                        </span>
                    </div>
                    <div
                        onClick={() => setAccountType("admin")}
                        className={`flex flex-col items-center cursor-pointer p-4 rounded-md border-2 ${
                            accountType === "admin"
                                ? "border-blue-500"
                                : "border-gray-200"
                        }`}
                    >
                        {/* Admin Icon */}
                        <AdminIcon />
                        <span
                            className={`text-sm font-medium ${
                                accountType === "admin"
                                    ? "text-blue-500"
                                    : "text-gray-700"
                            }`}
                        >
                            Admin
                        </span>
                    </div>
                </div>

                {/* Conditional Rendering for Forms */}
                <div>
                    {accountType === "user" && <UserLogin />}
                    {accountType === "admin" && <AdminLogin />}
                </div>
            </div>

            {/* Signup Prompt */}
            <p className="text-center text-gray-600 mt-4">
                No account?{" "}
                <a href="/register" className="text-blue-500 font-medium">
                    Signup
                </a>
            </p>
        </div>
    );
};

export default LoginPage;

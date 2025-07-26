"use client";
import { isValidEmailAddressFormat } from "@/lib/utils";
import { signIn } from "next-auth/react";
import { useState } from "react";
import toast from "react-hot-toast";

const UserLogin = () => {
    const [error, setError] = useState("");

    const handleUserLogin = async (e: any) => {
        e.preventDefault();
        const email = e.target[0].value;
        const password = e.target[1].value;

        if (!isValidEmailAddressFormat(email)) {
            setError("Email is invalid");
            toast.error("Email is invalid");
            return;
        }

        if (!password || password.length < 8) {
            setError("Password is invalid");
            toast.error("Password is invalid");
            return;
        }

        const res = await signIn("credentials", {
            redirect: false,
            email,
            password,
        });

        if (res?.error) {
            setError("Invalid email or password");
            toast.error("Invalid email or password");
        } else {
            setError("");
            toast.success("Successful login");
        }
    };

    return (
        <form onSubmit={handleUserLogin} className="space-y-6">
            <div>
                <label htmlFor="user-email" className="block text-sm font-medium text-gray-900">
                    Email
                </label>
                <input
                    id="user-email"
                    type="email"
                    required
                    className="block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                />
            </div>
            <div>
                <label htmlFor="user-password" className="block text-sm font-medium text-gray-900">
                    Password
                </label>
                <input
                    id="user-password"
                    type="password"
                    required
                    className="block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                />
            </div>
            <button
                type="submit"
                className="w-full bg-indigo-500 text-white py-2 px-4 rounded-md"
            >
                Login
            </button>
            {error && <p className="text-red-600 mt-2 text-sm">{error}</p>}
        </form>
    );
};

export default UserLogin;

"use client"; // Add this if using Next.js 13 with the app directory

import { useState } from "react";
import { signIn } from "next-auth/react";
import toast from "react-hot-toast";
import { useRouter } from "next/navigation";

const AdminLogin = () => {
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [loading, setLoading] = useState(false); // Add loading state
    const router = useRouter();  // Ensure this is inside the function component

    const handleAdminLogin = async (e: any) => {
        e.preventDefault();
        setLoading(true); // Set loading to true when starting the login

        const result = await signIn("credentials", {
            email: username,
            password,
            isAdmin: true, // Pass the isAdmin flag
            redirect: false,
        });

        setLoading(false); // Reset loading state after the login attempt

        if (result?.ok) {
            toast.success("Admin login successful!");
            router.push("/admin"); // Navigate to the dashboard on success
        } else {
            toast.error("Invalid admin credentials");
        }
    };

    return (
        <form onSubmit={handleAdminLogin} className="space-y-6">
            <div>
                <label htmlFor="admin-username" className="block text-sm font-medium text-gray-900">
                    Username
                </label>
                <input
                    id="admin-username"
                    type="text"
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                    required
                    className="block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                />
            </div>
            <div>
                <label htmlFor="admin-password" className="block text-sm font-medium text-gray-900">
                    Password
                </label>
                <input
                    id="admin-password"
                    type="password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    required
                    className="block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                />
            </div>
            <button
                type="submit"
                className="w-full bg-indigo-500 text-white py-2 px-4 rounded-md"
                disabled={loading} // Disable the button while loading
            >
                {loading ? "Logging in..." : "Login"}
            </button>
        </form>
    );
};

export default AdminLogin;

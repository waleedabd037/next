import { getServerSession } from "next-auth/next";
import { redirect } from "next/navigation";
import { authOptions } from "@/app/api/auth/[...nextauth]/route";
import { Session } from "next-auth";
//import "../../globals.css";  // Ensure global styles are imported

export default async function Layout({
    children,
}: Readonly<{ children: React.ReactNode }>) {
    const session = await getServerSession(authOptions) as Session;
  
    // Check the session object in your logs
    // Redirect if the role is not admin
    if (session?.user?.role !== "admin") {
        console.log("inside admin should not be admin", session?.user?.role);
        redirect("/login"); // Redirect to login if not an admin
    }

    return (
        <div style={{ paddingTop: "30px" }}> {/* Add padding to the top of the layout */}
            {children}
        </div>
    );
}

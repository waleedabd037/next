import { Session, getServerSession } from "next-auth";
import { authOptions } from "@/app/api/auth/[...nextauth]/route";
import SessionProvider from "@/utils/SessionProvider";
import { Inter } from "next/font/google";
import { Footer, Header } from "@/components";
import Providers from "@/Providers";
import { redirect } from "next/navigation"; // For server-side redirects
import "./globals.css";
const inter = Inter({ subsets: ["latin"] });
export default async function Layout({
    children,
}: Readonly<{ children: React.ReactNode }>) {
  //  let lastRole: string | null = null;
    const session = await getServerSession(authOptions) as Session;
  // Check the session object in your logs
    // Redirect if the role is not admin
    //if (session?.user?.role === "admin") {
        console.log("main layout should be admin", session)
      // redirect("/dashboard/admin"); // Redirect to home or login if not an admin
       // }else{console.log("main layout should not be admin", session?.user?.role)}
 // Render the children for admin pages
    return (
      <html lang="en">
          <head>
      <script
        type="module"
        src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"
      ></script>
    </head>
  
          <body className={inter.className}>
              <SessionProvider session={session}>
                  <Header />
                  <Providers>{children}</Providers>
                  <Footer />
              </SessionProvider>
          </body>
      </html>
  );
}
    // Redirect admin users to the admin dashboard
    //if (role === "admin") {
      //  redirect("/dashboard/admin"); // Redirect to admin dashboard if role is admin
//    }

    
import { Session, getServerSession } from "next-auth";
import { authOptions } from "@/lib/authOptions";
import SessionProvider from "@/utils/SessionProvider";
import { Inter } from "next/font/google";
import { Footer, Header } from "@/components";
import Providers from "@/Providers";
import { redirect } from "next/navigation"; // Optional, only if using redirect logic
import Script from "next/script"; // ✅ Import Script component

import "./globals.css";

const inter = Inter({ subsets: ["latin"] });

export default async function Layout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  const session = (await getServerSession(authOptions)) as Session;

  console.log("main layout session:", session);

  return (
    <html lang="en">
      <head>
        {/* ✅ Replaces <script> tag with Next.js Script component */}
        <Script
          type="module"
          src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"
          strategy="afterInteractive"
        />
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

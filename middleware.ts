import { withAuth } from "next-auth/middleware";
import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export default withAuth(
  function middleware(request: NextRequest) {
    const { pathname } = request.nextUrl;
    const role = (request as any).nextauth?.token?.role;

    console.log("🔐 Middleware running — Role:", role);
    console.log("📍 Pathname:", pathname);

    // ⛔ If not logged in, do nothing (don't restrict anything)
    if (!role) {
      console.log("👤 No user logged in. Allowing access.");
      return NextResponse.next();
    }

    // 🚫 Admin can only access /admin
    if (role === "admin" && !pathname.startsWith("/admin")) {
      console.log("⛔ Admin trying to access non-admin page. Redirecting to /admin.");
      return NextResponse.redirect(new URL("/admin", request.url));
    }

    // 🚫 User cannot access /admin
    if (role === "user" && pathname.startsWith("/admin")) {
      console.log("⛔ User trying to access admin page. Redirecting to /.");
      return NextResponse.redirect(new URL("/", request.url));
    }

    // ✅ Otherwise allow
    return NextResponse.next();
  },
  {
    callbacks: {
      authorized: ({ token }) => {
        // ✅ Don't block unauthenticated users from public routes
        console.log("✅ Token received in middleware:", token);
        return true; // Let everyone through, even if not logged in
      },
    },
  }
);

// ✅ Apply to all routes except API & static assets
export const config = {
  matcher: ["/((?!api|_next|static|favicon.ico|.*\\..*).*)"],
};

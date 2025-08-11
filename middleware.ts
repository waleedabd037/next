// middleware.ts
import { withAuth } from "next-auth/middleware";
import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export default withAuth(
  function middleware(request: NextRequest) {
    const { pathname } = request.nextUrl;
    const role = (request as any).nextauth?.token?.role;

    if (!role) {
      return NextResponse.next();
    }

    // Redirect admin trying to access non-admin pages
    if (role === "admin" && !pathname.startsWith("/admin")) {
      const url = new URL("/admin", request.url);
      url.searchParams.set("redirectReason", "adminOnly");
      return NextResponse.redirect(url);
    }

    // Redirect user trying to access admin pages
    if (role === "user" && pathname.startsWith("/admin")) {
      const url = new URL("/", request.url);
      url.searchParams.set("redirectReason", "noAdminAccess");
      return NextResponse.redirect(url);
    }

    return NextResponse.next();
  },
  {
    callbacks: {
      authorized: ({ token }) => true, // Let middleware check roles itself
    },
  }
);

export const config = {
  matcher: ["/((?!api|_next|static|favicon.ico|.*\\..*).*)"],
};

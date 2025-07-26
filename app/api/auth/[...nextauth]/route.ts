import NextAuth from "next-auth";
import { Account, User as AuthUser, Session as NextAuthSession, JWT } from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";
import bcrypt from "bcryptjs";
import prisma from "@/utils/db";
import { DefaultSession } from "next-auth";

declare module "next-auth" {
    interface Session {
        user: {
            id: string;
            email: string;
            role: string; // Ensure the role is part of the session user object
        } & DefaultSession["user"];
    }

    interface JWT {
        id: string;
        role: string;
    }
}

export const authOptions: any = {
    providers: [
        CredentialsProvider({
            id: "credentials",
            name: "Credentials",
            credentials: {
                email: { label: "Email", type: "text" },
                password: { label: "Password", type: "password" },
                isAdmin: { label: "isAdmin", type: "text", required: false }, // Optional flag for admin login
            },
            async authorize(credentials: any) {
                try {
                    const { email, password, isAdmin } = credentials;
                    let user;

                    if (isAdmin === "true") {
                        // Check the admin table if isAdmin is true
                        user = await prisma.admin.findFirst({
                            where: { email },
                        });
                    } else {
                        // Default to checking the user table
                        user = await prisma.user.findFirst({
                            where: { email },
                        });
                    }

                    if (user) {
                        const isPasswordCorrect = await bcrypt.compare(password, user.password!);
                        if (isPasswordCorrect) {
                            return {
                                id: user.id,
                                email: user.email,
                                role: isAdmin === "true" ? "admin" : "user", // Return role as part of the user object
                            };
                        }
                    }
                } catch (err: any) {
                    console.error("Error during authentication", err);
                    throw new Error("Authentication failed");
                }

                return null; // Return null if login fails
            },
        }),
    ],
    callbacks: {
        async jwt({ token, user }: { token: JWT; user?: AuthUser | any }) {
            // When the user first signs in, add the user.id and user.role to the token
            if (user) {
                token.id = user.id;
                token.role = user.role;
            }
            return token;
        },
        async session({ session, token }: { session: NextAuthSession; token: JWT }) {
            // Attach role and id from token to session.user
            if (token) {
                session.user = {
                    ...session.user,
                    id: token.id,
                    role: token.role,
                };
            }
            return session;
        },
        async signIn({ user }: { user: AuthUser | any }) {
            if (user) {
                return true; // Ensure the user object is passed properly
            }
            return false;
        },
    },
};

export const handler = NextAuth(authOptions);
export { handler as GET, handler as POST };

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
            role: string;
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
                isAdmin: { label: "isAdmin", type: "text", required: false },
            },
            async authorize(credentials: any) {
                try {
                    const { email, password, isAdmin } = credentials;
                    let user;

                    if (isAdmin === "true") {
                        user = await prisma.admin.findFirst({
                            where: { email },
                        });
                    } else {
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
                                role: isAdmin === "true" ? "admin" : "user",
                            };
                        }
                    }
                } catch (err: any) {
                    console.error("Error during authentication", err);
                    throw new Error("Authentication failed");
                }

                return null;
            },
        }),
    ],
    callbacks: {
        async jwt({ token, user }: { token: JWT; user?: AuthUser | any }) {
            if (user) {
                const customUser = user as { id: string; role: string };
                token.id = customUser.id;
                token.role = customUser.role;
            }
            return token;
        },
        async session({ session, token }: { session: NextAuthSession; token: JWT }) {
            session.user = {
                ...session.user,
                id: token.id as string,
                role: token.role as string,
            };
            return session;
        },
        async signIn({ user }: { user: AuthUser | any }) {
            return !!user;
        },
    },
};

export const handler = NextAuth(authOptions);
export { handler as GET, handler as POST };

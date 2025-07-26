// File: /app/fetching-interactions/route.ts
import { NextRequest, NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export async function GET(req: NextRequest) {
  const { searchParams } = new URL(req.url);
  const userId = searchParams.get("userId");

  if (!userId) {
    return NextResponse.json({}, { status: 200 }); // Return an empty JSON if userId is missing
  }

  try {
    // Fetch user interactions from the database
    const interactions = await prisma.userInteraction.findMany({
      where: { userId },
      orderBy: { createdAt: "desc" }, // Sort by most recent
      take: 15, // Limit to 15 results
    });

    // Return the interactions, even if empty (empty array in JSON)
    return NextResponse.json(interactions, { status: 200 });
  } catch (error) {
    console.error("Error fetching interactions:", error);
    return NextResponse.json(
      { error: "Internal Server Error" },
      { status: 500 }
    );
  } finally {
    await prisma.$disconnect(); // Ensure Prisma connection is closed
  }
}

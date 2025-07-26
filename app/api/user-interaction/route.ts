import { NextRequest, NextResponse } from "next/server";
import prisma from "@/utils/db"; // Adjust path to your Prisma client instance

export async function POST(req: NextRequest) {
  try {
    const body = await req.json();
    const { userId, productId, interactionType } = body;

    // Validate input fields
    if (!userId || !productId || !interactionType) {
      return NextResponse.json(
        { error: "All fields (userId, productId, interactionType) are required" },
        { status: 400 }
      );
    }

    // Optional: Validate interactionType if it's an enum
    const allowedInteractionTypes = ['view', 'click', 'purchase']; // Example values
    if (!allowedInteractionTypes.includes(interactionType)) {
      return NextResponse.json(
        { error: "Invalid interactionType" },
        { status: 400 }
      );
    }

    const interaction = await prisma.userInteraction.create({
      data: {
        userId,
        productId,
        interactionType,
      },
    });

    const interactions = await prisma.userInteraction.findMany({
      where: { userId },
      orderBy: { createdAt: "asc" }, // Sort by oldest first
    });

    // If there are more than 15 interactions, delete the oldest ones
    if (interactions.length > 15) {
      const excess = interactions.length - 15;
      const idsToRemove = interactions.slice(0, excess).map((interaction: { id: string }) => interaction.id); // Explicitly type the interaction parameter
  
      // Delete the excess interactions
      await prisma.userInteraction.deleteMany({
        where: { id: { in: idsToRemove } },
      });
    }

    return NextResponse.json({ message: "Interaction recorded successfully", interaction });

  } catch (error) {
    console.error("Error recording interaction:", error);
    return NextResponse.json({ error: "Failed to record interaction" }, { status: 500 });
  }
}

export async function GET(req: NextRequest) {
  try {
    const interactions = await prisma.userInteraction.findMany({
      take: 10,  // Example of limiting results to 10
      skip: 0,   // Example of pagination (skip first 0 items)
    });
    return NextResponse.json(interactions);
  } catch (error) {
    console.error("Error fetching interactions:", error);
    return NextResponse.json({ error: "Failed to fetch interactions" }, { status: 500 });
  }
}

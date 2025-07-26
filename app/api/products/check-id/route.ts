import { NextRequest, NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export async function GET(req: NextRequest) {
  const { searchParams } = new URL(req.url);
  const id = searchParams.get("id");

  if (!id) {
    return NextResponse.json({ error: "Missing product ID" }, { status: 400 });
  }

  try {
    // Use findMany to check for multiple matches if the ID is not unique
    const existingProducts = await prisma.product.findMany({
      where: { id },
    });

    return NextResponse.json({ exists: existingProducts.length > 0 }, { status: 200 });
  } catch (error) {
    console.error("Error checking product ID:", error);
    return NextResponse.json(
      { error: "Internal Server Error" },
      { status: 500 }
    );
  } finally {
    await prisma.$disconnect();
  }
}

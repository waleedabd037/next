const { PrismaClient } = require("@prisma/client");
const { loadModel, predictNextProducts } = require("../model");
const prisma = new PrismaClient();

async function fetchUserData(req, res) {
  // Ensure the request method is POST
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method Not Allowed" });
  }

  const { userId } = req.body;

  if (!userId) {
    return res.status(400).json({ error: "userId is required" });
  }

  try {
    // Load the pre-trained model
    console.log("Loading model...");
    await loadModel();

    // Fetch user interactions from the database
    console.log("Fetching user interactions...");
    const interactions = await prisma.userInteraction.findMany({
      where: { userId },
      orderBy: { createdAt: "desc" },
      take: 5, // Take the latest 5 interactions for prediction
    });

    console.log("Fetched interactions:", interactions);

    // Extract product IDs for prediction input
    const productIds = interactions.map((interaction) => interaction.productId);
    console.log("Product IDs for prediction:", productIds);

    // Ensure we have enough product IDs for prediction
    if (productIds.length === 0) {
      console.log("No interactions found for prediction");
      return res
        .status(404)
        .json({ error: "No interactions found for prediction" });
    }

    // Make a prediction using the latest interactions
    console.log("Making prediction...");
    const prediction = await predictNextProducts(productIds);
    console.log("Model Prediction:", prediction);

    // Check if prediction is empty
    if (!prediction || prediction.length === 0) {
      console.log("Prediction is empty or invalid");
      return res
        .status(404)
        .json({ error: "Prediction returned no valid product IDs" });
    }

    // Fetch the most viewed product globally
    console.log("Fetching the most viewed product...");
    const mostViewed = await prisma.userInteraction.groupBy({
      by: ["productId"],
      _count: {
        productId: true,
      },
      orderBy: {
        _count: {
          productId: "desc",
        },
      },
      take: 1, // Take the product with the highest count
    });

    let mostViewedProductWithDetails = null;
    if (mostViewed.length > 0) {
      const productId = mostViewed[0].productId;
      mostViewedProductWithDetails = await prisma.product.findUnique({
        where: { id: productId },
        select: {
          id: true,
          mainImage: true,
          slug: true, // Fetch the slug for linking
          title: true, // Fetch the product title
        },
      });
    }

    console.log("Most viewed product details:", mostViewedProductWithDetails);

    // Fetch the mainImage, title, and slug for each predicted product ID
    console.log("Fetching products with images...");
    const productsWithDetails = await prisma.product.findMany({
      where: {
        id: { in: prediction }, // Match products with the predicted product IDs
      },
      select: {
        id: true,
        mainImage: true,
        slug: true, // Fetch the slug for linking
        title: true, // Fetch the product title
      },
    });

    console.log("Fetched products with details:", productsWithDetails);

    // Check if productsWithDetails is empty
    if (!productsWithDetails || productsWithDetails.length === 0) {
      console.log("No products found for the predicted IDs");
      return res
        .status(404)
        .json({ error: "No products found for the predicted IDs" });
    }

    // Combine the most viewed product and AI-predicted products
    const responseProducts = [];
    if (mostViewedProductWithDetails) {
      responseProducts.push({
        productId: mostViewedProductWithDetails.id,
        mainImage: mostViewedProductWithDetails.mainImage,
        slug: mostViewedProductWithDetails.slug,
        title: mostViewedProductWithDetails.title,
        type: "Most Viewed", // Indicate it's the most viewed product
      });
    }
    responseProducts.push(
      ...productsWithDetails.map((product) => ({
        productId: product.id,
        mainImage: product.mainImage,
        slug: product.slug,
        title: product.title,
        type: "AI Prediction", // Indicate it's an AI-predicted product
      }))
    );

    console.log("Final response products:", responseProducts);

    // Respond with the combined products
    return res.status(200).json({ products: responseProducts });
  } catch (error) {
    // Catch and log any errors
    console.error("Error fetching interactions or predicting:", error);
    return res
      .status(500)
      .json({ error: "Internal Server Error", message: error.message });
  } finally {
    // Disconnect Prisma client
    await prisma.$disconnect();
  }
}

module.exports = { fetchUserData };

/*const { PrismaClient } = require('@prisma/client');
const cron = require('node-cron');
const prisma = new PrismaClient();

async function fetchTrendingProduct() {
  try {
    console.log("Fetching trending product...");

    // Fetch the most trending product and its main image
    const trendingProduct = await prisma.userInteraction.groupBy({
      by: ['productId'],
      _count: {
        productId: true,
      },
      orderBy: {
        _count: {
          productId: 'desc',
        },
      },
      take: 1,
    });

    if (trendingProduct.length > 0) {
      const productId = trendingProduct[0].productId;

      // Fetch the mainImage of the trending product
      const productDetails = await prisma.product.findUnique({
        where: { id: productId },
        select: {
          id: true,
          mainImage: true,
        },
      });

      if (productDetails) {
        console.log('Most trending product:', {
          productId: productDetails.id,
          mainImage: productDetails.mainImage,
        });
      } else {
        console.log('Trending product not found in the product table.');
      }
    } else {
      console.log('No trending product found.');
    }
  } catch (error) {
    console.error('Error fetching trending product:', error);
  } finally {
    await prisma.$disconnect(); // Ensure Prisma disconnects after use
  }
}

// Schedule the task to run every 10 seconds to fetch and log the most trending product
cron.schedule('*//*10 * * * * *', async () => {
  try {
    console.log('Cron job triggered to fetch the most trending product...');
    await fetchTrendingProduct();
  } catch (error) {
    console.error('Error in cron job:', error);
  }
});

module.exports = { fetchTrendingProduct };*/

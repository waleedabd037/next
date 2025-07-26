// deleteAllData.ts
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function deleteAllData() {
  try {
    await prisma.$transaction([
      prisma.userInteraction.deleteMany(),
      prisma.wishlist.deleteMany(),
      prisma.customer_order_product.deleteMany(),
      prisma.customer_order.deleteMany(),
      prisma.image.deleteMany(),
      prisma.product.deleteMany(),
      prisma.category.deleteMany(),
      prisma.admin.deleteMany(),
    ]);

    console.log('All data deleted successfully.');
  } catch (error) {
    console.error('Error deleting data:', error);
  } finally {
    await prisma.$disconnect();
  }
}

deleteAllData();

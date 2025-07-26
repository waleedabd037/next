const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function deleteAllData() {
  try {
    // Delete data from child tables first to avoid foreign key constraint issues
    await prisma.customer_order_product.deleteMany({});
    await prisma.Wishlist.deleteMany({});
    await prisma.Image.deleteMany({});
    
    // Now delete data from parent tables
    await prisma.Product.deleteMany({});
    await prisma.Customer_order.deleteMany({});
    await prisma.User.deleteMany({});
    await prisma.Admin.deleteMany({});
    await prisma.Category.deleteMany({});
    
    console.log('All data deleted successfully.');
  } catch (error) {
    console.error('Error deleting data:', error);
  } finally {
    await prisma.$disconnect();
  }
}

deleteAllData();

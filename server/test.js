const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function deleteAllData() {
  console.log('Deleting all data...');
  await prisma.$connect();
  console.log('Successfully connected to the database');

  try {
    // Delete from all dependent tables first to avoid foreign key constraints
    await prisma.customer_order_product.deleteMany();
    await prisma.customer_order.deleteMany();
    await prisma.product.deleteMany();
    await prisma.category.deleteMany(); // Clear the Category table last

    console.log('All data from all tables has been deleted successfully');
  } catch (error) {
    console.error('Error while deleting data:', error);
  } finally {
    await prisma.$disconnect();
    console.log('Database connection closed');
  }
}

deleteAllData();

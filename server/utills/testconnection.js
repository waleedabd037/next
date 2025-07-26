const { PrismaClient } = require('@prisma/client'); // Use require instead of import
const prisma = new PrismaClient();

async function testConnection() {
  try {
    const users = await prisma.user.findMany(); // Change this to any model in your Prisma schema
    console.log(users);
  } catch (error) {
    console.error('Error connecting to the database:', error);
  } finally {
    await prisma.$disconnect();
  }
}

testConnection();

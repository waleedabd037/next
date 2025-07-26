// Import Prisma client
const { PrismaClient } = require('@prisma/client');

// Instantiate PrismaClient
const prisma = new PrismaClient();

async function main() {
  // Delete all records from the Admin table
  const deletedAdmins = await prisma.admin.deleteMany();

  console.log(`Deleted ${deletedAdmins.count} admins`);
}

main()
  .catch(e => {
    throw e;
  })
  .finally(async () => {
    // Disconnect Prisma client
    await prisma.$disconnect();
  });

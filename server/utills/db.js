const { PrismaClient } = require('@prisma/client');

const prismaClientSingleton = () => {
  return new PrismaClient();
}

const globalForPrisma = globalThis;

// If the Prisma client isn't already set, create a new one
const prisma = globalForPrisma.prisma ?? prismaClientSingleton();

// In development, store the Prisma client globally to avoid multiple instances
if (process.env.NODE_ENV !== 'production') {
  globalForPrisma.prisma = prisma;
}

module.exports = prisma;

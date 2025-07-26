const bcrypt = require("bcryptjs");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

async function createAdmin() {
  const plainPassword = "123Autogen";
  const email = "john.doe@autogen.com";

  const hashedPassword = await bcrypt.hash(plainPassword, 10);

  const admin = await prisma.admin.create({
    data: {
      email,
      password: hashedPassword,
    },
  });

  console.log("Admin created:", admin);
}

createAdmin()
  .then(() => {
    console.log("Done");
    prisma.$disconnect();
  })
  .catch((error) => {
    console.error("Error creating admin:", error);
    prisma.$disconnect();
  });

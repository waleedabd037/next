const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const demoBurhans = [
  {
    name: "Burhan A",
    age: 25,
    address: "123 Main St, Cityville",
  },
  {
    name: "Burhan B",
    age: 30,
    address: "456 Oak Rd, Townsville",
  },
  {
    name: "Burhan C",
    age: 35,
    address: "789 Pine Ln, Villageville",
  },
];

async function insertBurhanData() {
  for (const burhan of demoBurhans) {
    await prisma.burhan.create({
      data: burhan,
    });
  }
  console.log("Demo Burhan data inserted successfully!");
}

insertBurhanData()
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });

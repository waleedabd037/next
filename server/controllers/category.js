const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function createCategory(request, response) {
  try {
    const { name } = request.body;
    const category = await prisma.category.create({
      data: {
        name,
      },
    });
    return response.status(201).json(category);
  } catch (error) {
    console.error("Error creating category:", error);
    return response.status(500).json({ error: "Error creating category" });
  }
}

async function updateCategory(request, response) {
  try {
    const { id } = request.params;
    const { name } = request.body;

    const existingCategory = await prisma.category.findUnique({
      where: {
        id: id,
      },
    });

    if (!existingCategory) {
      return response.status(404).json({ error: "Category not found" });
    }

    const updatedCategory = await prisma.category.update({
      where: {
        id: existingCategory.id,
      },
      data: {
        name,
      },
    });

    return response.status(200).json(updatedCategory);
  } catch (error) {
    return response.status(500).json({ error: "Error updating category" });
  }
}

async function deleteCategory(request, response) {
  const { id } = request.params;
  try {
    // Log to ensure the id is correct
    console.log(`Attempting to delete category with ID: ${id}`);

    // First, delete or update the related UserInteractions for this category
    const deletedInteractions = await prisma.userInteraction.deleteMany({
      where: {
        product: {
          categoryId: id,
        },
      },
    });

    // Log the number of deleted interactions
    console.log(`Deleted ${deletedInteractions.count} user interactions`);

    // Now delete the Category
    const deletedCategory = await prisma.category.delete({
      where: { id },
    });

    // Log category deletion
    console.log('Category deleted successfully:', deletedCategory);

    response.status(200).send('Category deleted successfully');
  } catch (error) {
    // Log the actual error message
    console.error('Error deleting category:', error);
    response.status(500).send(`Error deleting category: ${error.message}`);
  }
}

async function getCategory(request, response) {
  const { id } = request.params;
  const category = await prisma.category.findUnique({
    where: {
      id: id,
    },
  });
  if (!category) {
    return response.status(404).json({ error: "Category not found" });
  }
  return response.status(200).json(category);
}

async function getAllCategories(request, response) {
  try {
    const categories = await prisma.category.findMany({});
    return response.json(categories);
  } catch (error) {
    return response.status(500).json({ error: "Error fetching categories" });
  }
}

module.exports = {
  createCategory,
  updateCategory,
  deleteCategory,
  getCategory,
  getAllCategories,
};

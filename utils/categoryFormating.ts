// categoryFormating.ts

export const formatCategoryName = (categoryName: string | undefined) => {
  if (!categoryName) {
    return ""; // Return an empty string or a default value if categoryName is undefined or null
  }
  return categoryName.split("-").join(" ");
};

export const convertCategoryNameToURLFriendly = (categoryName: string) => {
  return categoryName.trim().toLowerCase().replace(/\s+/g, "-");
};

"use client";
import React, { useState, useEffect } from "react";
import ProductItem from "./ProductItem";
import Heading from "./Heading";

interface Product {
  id: string;
  slug: string;
  title: string;
  mainImage: string;
  price: number;
  rating: number;
  description: string;
  manufacturer: string;
  inStock: number;
}

const ProductsSection = () => {
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const response = await fetch("http://localhost:3001/api/products", {
          cache: "no-store",
        });

        if (!response.ok) {
          throw new Error("Failed to fetch products");
        }

        const data: Product[] = await response.json();
        setProducts(data);
      } catch (error) {
        setError("Error loading products. Please try again later.");
        console.error(error);
      } finally {
        setLoading(false);
      }
    };

    fetchProducts();
  }, []);

  if (loading) return <div>Loading products...</div>;
  if (error) return <div>{error}</div>;

  return (
    <div className="bg-gradient-to-b from-gray-800 via-gray-900 to-black py-20">
      <div className="max-w-screen-2xl mx-auto pt-20">
        <Heading title="FEATURED CARS" />
        <div className="grid grid-cols-1 md:grid-cols-2 justify-items-center py-10 gap-x-4 px-10 gap-y-8">
          {products.map((product) => (
            <ProductItem key={product.id} product={product} color="white" />
          ))}
        </div>
      </div>
    </div>
  );
};

export default ProductsSection;

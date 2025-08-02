'use client';

import {
  StockAvailabillity,
  UrgencyText,
  ProductTabs,
  SingleProductDynamicFields,
  AddToWishlistBtn,
} from '@/components';
import Image from 'next/image';
import React, { useEffect, useState } from 'react';

interface Product {
  id: string;
  title: string;
  price: number;
  manufacturer: string;
  inStock: number;
  mainImage: string;
  description: string;
  slug: string;
  categoryId: string;
  rating: number;
}

interface ImageItem {
  imageID: string;
  productID: string;
  image: string;
}

// ✅ Hardcoded API base URL
const apiBaseUrl = 'https://server-production-e6d2.up.railway.app';

const SingleProductClient = ({ slug }: { slug: string }) => {
  const [product, setProduct] = useState<Product | null>(null);
  const [images, setImages] = useState<ImageItem[]>([]);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchProductData = async () => {
      try {
        const res = await fetch(`${apiBaseUrl}/api/slugs/${slug}`);
        if (!res.ok) throw new Error('Failed to fetch product');
        const prod = await res.json();
        setProduct(prod);

        const imageRes = await fetch(`${apiBaseUrl}/api/images/${prod.id}`);
        if (imageRes.ok) {
          const imgs = await imageRes.json();
          setImages(imgs);
        }
      } catch (err) {
        setError('Error fetching product');
        console.error(err);
      }
    };

    fetchProductData();
  }, [slug]);

  if (error) return <div className="text-red-600 text-center py-10">{error}</div>;
  if (!product) return <div className="text-center py-10">Loading...</div>;

  return (
    <div className="w-full bg-gradient-to-r from-gray-900 via-gray-800 to-gray-700">
      <div className="max-w-screen-2xl mx-auto">
        <div className="flex justify-center gap-x-16 pt-10 max-lg:flex-col items-center gap-y-5 px-5">
          <div className="w-[70%] max-lg:w-full">
            <div className="flex justify-center">
              <Image
                src={product.mainImage}
                width={1000}
                height={500}
                alt="main image"
              />
            </div>

            <div className="flex justify-around mt-5 flex-wrap gap-y-1 max-[500px]:justify-center max-[500px]:gap-x-1">
              {images.map((imageItem) => (
                <Image
                  key={imageItem.imageID}
                  src={imageItem.image.startsWith('http') ? imageItem.image : `/${imageItem.image}`}
                  width={100}
                  height={100}
                  alt="image"
                  className="w-auto h-auto"
                />
              ))}
            </div>
          </div>

          <div className="flex flex-col gap-y-7 text-white max-[500px]:text-center">
            <h1 className="text-3xl">{product.title}</h1>
            <p className="text-xl font-semibold">${product.price}</p>
            <StockAvailabillity stock={94} inStock={product.inStock} />
            <SingleProductDynamicFields product={product} />

            <div className="flex flex-col gap-y-2 max-[500px]:items-center">
              <AddToWishlistBtn product={product} slug={slug} />
              <div className="flex gap-x-2">
                {['visa', 'mastercard', 'ae', 'paypal', 'dinersclub', 'discover'].map((icon) => (
                  <Image
                    key={icon}
                    src={`/${icon}.svg`}
                    width={50}
                    height={50}
                    alt={`${icon} icon`}
                    className="h-auto w-auto"
                  />
                ))}
              </div>
            </div>
          </div>
        </div>

        <div className="py-16">{/* Optional content */}</div>
      </div>
    </div>
  );
};

export default SingleProductClient;

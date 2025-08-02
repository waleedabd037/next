'use client';

import React, { useEffect, useState } from 'react';
import Image from 'next/image';
import Link from 'next/link';
import { useSession } from 'next-auth/react';
import { apiBaseUrl } from '@/lib/constants'; // ✅ imported

const ProductImagesBanner: React.FC = () => {
  const { data: session } = useSession();
  const [images, setImages] = useState<
    { productId: string; mainImage: string; slug: string; title: string }[]
  >([]);
  const [loading, setLoading] = useState<boolean>(true);

  useEffect(() => {
    const fetchProductImages = async () => {
      if (!session?.user?.id) {
        console.error('User is not authenticated');
        return;
      }

      try {
        const modelResponse = await fetch(`${apiBaseUrl}/api/model`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ userId: session.user.id }),
        });

        if (!modelResponse.ok) {
          console.error('Failed to fetch product data');
          return;
        }

        const modelData = await modelResponse.json();
        setImages(modelData.products);
      } catch (error) {
        console.error('Error fetching product data:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchProductImages();
  }, [session?.user?.id]);

  if (loading) {
    return <div>Loading...</div>;
  }

  return (
    <div className="w-full bg-gray-100 py-4">
      {images.length > 0 ? (
        <div className="flex justify-center gap-4 items-center">
          {images.map((product, index) => (
            <div key={index} className="cursor-pointer text-center">
              <Link href={`/product/${product.slug}`}>
                <Image
                  src={product.mainImage ? `/${product.mainImage}` : '/product_placeholder.jpg'}
                  width={150}
                  height={150}
                  sizes="100vw"
                  className="object-contain"
                  alt={product.title}
                />
              </Link>
              <Link href={`/product/${product.slug}`}>
                <p className="mt-2 text-sm font-medium text-gray-800 hover:text-blue-500">
                  {product.title}
                </p>
              </Link>
            </div>
          ))}
        </div>
      ) : (
        <div className="text-center">No products available</div>
      )}
    </div>
  );
};

export default ProductImagesBanner;

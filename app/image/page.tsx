// app/page.tsx
'use client';

import Image from 'next/image';
import React from 'react';

const Page = () => {
  const imageUrl =
    'https://gtvytcgrhrelhbwogyoe.supabase.co/storage/v1/object/public/product-images//1753708940826.jpg';

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-100">
      <h1 className="text-2xl font-bold mb-4">Product Image</h1>
      <Image
        src={imageUrl}
        alt="Product"
        width={400}
        height={300}
        className="rounded shadow-lg"
      />
    </div>
  );
};

export default Page;

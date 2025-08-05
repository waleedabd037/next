"use client";

import Image from "next/image";

const CartProductImage = ({ src, alt }: { src: string; alt: string }) => {
  return (
    <div className="w-28 h-28 relative">
      <Image
        src={src}
        alt={alt}
        fill
        className="object-contain"
        sizes="(max-width: 768px) 100vw, 33vw"
      />
    </div>
  );
};

export default CartProductImage;

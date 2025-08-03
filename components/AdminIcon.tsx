"use client";
import Image from "next/image";

const AdminIcon = () => {
    return (
        <Image
            src="https://gtvytcgrhrelhbwogyoe.supabase.co/storage/v1/object/public/product-images/admin.jpg"
            alt="Admin Icon"
            width={60}
            height={60}
            className="mb-2 rounded-full object-cover"
        />
    );
};

export default AdminIcon;

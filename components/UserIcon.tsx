"use client";
import Image from "next/image";

const UserIcon = () => {
    return (
        <Image
            src="https://gtvytcgrhrelhbwogyoe.supabase.co/storage/v1/object/public/product-images/user.jpg"
            alt="User Icon"
            width={60}
            height={60}
            className="mb-2 rounded-full object-cover"
        />
    );
};

export default UserIcon;

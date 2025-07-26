import React from "react";
import { MdDashboard, MdCategory } from "react-icons/md";
import { FaTable, FaRegUser, FaGear, FaBagShopping } from "react-icons/fa6";
import Link from "next/link";

const DashboardSidebar = () => {
  return (
    <div className="xl:w-[400px] h-full max-xl:w-full bg-gradient-to-b from-gray-800 via-gray-900 to-black">
      <Link href="/admin">
        <div className="flex gap-x-2 w-full hover:bg-gray-700 cursor-pointer items-center py-6 pl-5 text-xl text-white">
          <MdDashboard className="text-2xl" />
          <span className="font-normal">Dashboard</span>
        </div>
      </Link>
      <Link href="/admin/orders">
        <div className="flex gap-x-2 w-full hover:bg-gray-700 cursor-pointer items-center py-6 pl-5 text-xl text-white">
          <FaBagShopping className="text-2xl" />
          <span className="font-normal">Orders</span>
        </div>
      </Link>
      <Link href="/admin/products">
        <div className="flex gap-x-2 w-full hover:bg-gray-700 cursor-pointer items-center py-6 pl-5 text-xl text-white">
          <FaTable className="text-2xl" />
          <span className="font-normal">Products</span>
        </div>
      </Link>
      <Link href="/admin/categories">
        <div className="flex gap-x-2 w-full hover:bg-gray-700 cursor-pointer items-center py-6 pl-5 text-xl text-white">
          <MdCategory className="text-2xl" />
          <span className="font-normal">Categories</span>
        </div>
      </Link>
      <Link href="/admin/users">
        <div className="flex gap-x-2 w-full hover:bg-gray-700 cursor-pointer items-center py-6 pl-5 text-xl text-white">
          <FaRegUser className="text-2xl" />
          <span className="font-normal">Users</span>
        </div>
      </Link>
    </div>
  );
};

export default DashboardSidebar;

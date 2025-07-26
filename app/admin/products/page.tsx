"use client";
import {
  CustomButton,
  DashboardProductTable,
  DashboardSidebar,
} from "@/components";
import React from "react";

const DashboardProducts = () => {
  return (
    <div className="py-2 bg-white">
      <div className="flex justify-start max-w-screen-2xl mx-auto h-full max-xl:flex-col max-xl:h-fit max-xl:gap-y-4">
        <DashboardSidebar />
        <DashboardProductTable />
      </div>
    </div>
  );
};

export default DashboardProducts;

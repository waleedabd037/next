"use client";
import { useSearchParams } from "next/navigation";
import { useEffect, useState } from "react";
import Popup from "@/components/Popup";
import { DashboardSidebar, StatsElement } from "@/components";
import { FaArrowUp } from "react-icons/fa6";

export default function AdminDashboardPage() {
  const searchParams = useSearchParams();
  const [showPopup, setShowPopup] = useState(false);
  const [popupMessage, setPopupMessage] = useState("");

  useEffect(() => {
    const reason = searchParams.get("redirectReason");
    if (reason) {
      if (reason === "adminOnly") {
        setPopupMessage("Admins can only access the admin dashboard.");
      } else if (reason === "noAdminAccess") {
        setPopupMessage("You are not allowed to access the admin dashboard.");
      }
      setShowPopup(true);
    }
  }, [searchParams]);

  return (
    <div className="bg-white flex justify-start max-w-screen-2xl mx-auto max-xl:flex-col">
      {showPopup && (
        <Popup message={popupMessage} onClose={() => setShowPopup(false)} />
      )}
      <DashboardSidebar />
      <div className="flex flex-col items-center ml-5 gap-y-4 w-full max-xl:ml-0 max-xl:px-2 max-xl:mt-5 max-md:gap-y-1">
        <div className="flex justify-between w-full max-md:flex-col max-md:w-full max-md:gap-y-1">
          <StatsElement />
          <StatsElement />
          <StatsElement />
        </div>
        <div className="w-full bg-gradient-to-b from-gray-800 via-gray-900 to-black text-white h-40 flex flex-col justify-center items-center gap-y-2">
          <h4 className="text-3xl text-gray-100 max-[400px]:text-2xl">
            Number of visitors today
          </h4>
          <p className="text-3xl font-bold">1200</p>
          <p className="text-green-300 flex gap-x-1 items-center">
            <FaArrowUp />
            12.5% Since last month
          </p>
        </div>
      </div>
    </div>
  );
}

"use client";
import { useSearchParams } from "next/navigation";
import { useEffect, useState } from "react";
import Popup from "@/components/Popup";

import { Hero, IntroducingSection, ProductsSection } from "@/components";
import CarViewer360 from "@/components/reel";

export default function Home() {
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
    <>
      {showPopup && (
        <Popup message={popupMessage} onClose={() => setShowPopup(false)} />
      )}
      <Hero />
      <IntroducingSection />
      <CarViewer360 />
      <ProductsSection />
    </>
  );
}

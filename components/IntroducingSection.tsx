import React from "react";
import Link from "next/link";
const VehicleShowcase = () => {
  return (
    <div className="bg-neutral-950 py-20">
      <div className="max-w-screen-2xl mx-auto px-6">
        <div className="grid grid-cols-3 gap-8 max-lg:grid-cols-1">
          {/* Sorento Card */}
          <div className="relative overflow-hidden group">
            <div className="aspect-[4/3] relative">
              <img
                src="/kia-card-tout-sorento.jpg"
                alt="2025 Sorento X-Line"
                className="w-full h-full object-cover"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black/80 to-transparent" />
            </div>
            <div className="absolute bottom-0 left-0 p-8 w-full">
              <p className="text-white text-sm font-medium mb-2">COMMANDING COMFORT</p>
              <h2 className="text-white text-3xl font-bold mb-4">2025 Sorento X-Line</h2>
              <Link
                href="/meet-sorento"
                className="inline-block border border-white text-white px-8 py-2 hover:bg-white hover:text-black transition-colors"
              >
                Meet Sorento
              </Link>
            </div>
          </div>

          {/* Sportage Card */}
          <div className="relative overflow-hidden group">
            <div className="aspect-[4/3] relative">
              <img
                src="/kia_card-tout-sportage.jpg"
                alt="2025 Sportage X-Line"
                className="w-full h-full object-cover"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black/80 to-transparent" />
            </div>
            <div className="absolute bottom-0 left-0 p-8 w-full">
              <p className="text-white text-sm font-medium mb-2">SAVVY, STYLISH, SPACIOUS</p>
              <h2 className="text-white text-3xl font-bold mb-4">2025 Sportage X-Line</h2>
              <Link
                href="/meet-sportage"
                className="inline-block border border-white text-white px-8 py-2 hover:bg-white hover:text-black transition-colors"
              >
                Meet Sportage
              </Link>
            </div>
          </div>

          {/* Telluride Card */}
          <div className="relative overflow-hidden group">
            <div className="aspect-[4/3] relative">
              <img
                src="/kia_card-tout-telluride.jpg"
                alt="2025 Telluride X-Line"
                className="w-full h-full object-cover"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black/80 to-transparent" />
            </div>
            <div className="absolute bottom-0 left-0 p-8 w-full">
              <p className="text-white text-sm font-medium mb-2">LUXURY IN ALL 3 ROWS</p>
              <h2 className="text-white text-3xl font-bold mb-4">2025 Telluride X-Line</h2>
              <Link
                href="/meet-telluride"
                className="inline-block border border-white text-white px-8 py-2 hover:bg-white hover:text-black transition-colors"
              >
                Meet Telluride
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default VehicleShowcase;
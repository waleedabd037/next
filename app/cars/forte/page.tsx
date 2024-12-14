// components/FortePage.tsx
"use client";

import React, { useState } from "react";

const FortePage = () => {
  const [selectedColor, setSelectedColor] = useState("Currant Red");
  const [carImage, setCarImage] = useState("images/currant red.png");
  const [mainImage, setMainImage] = useState(
    "images/kia_forte_2024_asset-carousel-1.jpg",
  );

  const galleryImages = [
    "images/kia_forte_2024_asset-carousel-1.jpg",
    "images/kia_forte_2024_asset-carousel-2.jpg",
    "images/kia_forte_2024_asset-carousel-6.jpg",
    "images/kia_forte_2024_asset-carousel-8.jpg",
  ];

  const handleColorChange = (colorName: string, imagePath: string) => {
    setSelectedColor(colorName);
    setCarImage(imagePath);
  };

  const handleScroll = (event: React.UIEvent<HTMLDivElement>) => {
    const galleryContainer = event.currentTarget;
    let closestImage = null;
    let minDistance = Infinity;

    galleryImages.forEach((src) => {
      const imageElement = document.querySelector(`img[src="${src}"]`);
      if (imageElement) {
        const rect = (imageElement as HTMLImageElement).getBoundingClientRect();
        const distance = Math.abs(
          rect.top - galleryContainer.getBoundingClientRect().top,
        );

        if (distance < minDistance) {
          minDistance = distance;
          closestImage = imageElement;
        }
      }
    });

    if (closestImage) {
      setMainImage((closestImage as HTMLImageElement).src);
    }
  };

  return (
    <div>
      {/* Hero Section */}
      <section className="relative h-screen w-full overflow-hidden">
        <img
          src="images/kia_forte_2024_mep_dynamic_hero_v3_XXL.jpg"
          alt="2024 Forte"
          className="absolute top-0 left-0 w-full h-full object-cover"
        />
        <div className="absolute top-1/4 left-10 text-white">
          <h1 className="text-5xl font-bold mb-6">2024 Forte</h1>
          <div className="space-y-6">
            <div>
              <p className="text-lg opacity-80">As shown 35 MPG HWY*</p>
              <h2 className="text-4xl font-bold">41 MPG HWY</h2>
            </div>
            <div>
              <p className="text-lg opacity-80">
                Standard Auto Emergency Braking Technology
              </p>
            </div>
            <div>
              <p className="text-lg opacity-80">Available Turbo Engine w/</p>
              <h2 className="text-4xl font-bold">201 hp</h2>
            </div>
          </div>
        </div>
      </section>

      {/* Show-Stopping Silhouette Section */}
      <section className="bg-gray-100 flex justify-center items-center min-h-screen">
        <div className="container mx-auto p-6 bg-white rounded-lg shadow-lg text-center">
          <h1 className="text-4xl font-bold mb-6">
            A show-stopping silhouette.
          </h1>
          <div className="w-full mb-8">
            <img
              id="car-image"
              src={carImage}
              alt="Car"
              className="mx-auto rounded-lg"
            />
          </div>
          <div>
            <p className="text-lg font-medium mb-4">
              Paint:{" "}
              <span id="selected-color" className="font-semibold">
                {selectedColor}
              </span>
            </p>
            <div className="flex justify-center space-x-4">
              <button
                onClick={() =>
                  handleColorChange("Currant Red", "images/currant red.png")
                }
                className="w-8 h-8 bg-red-600 rounded-full border-2 border-transparent hover:border-black focus:border-black"
              ></button>
              <button
                onClick={() =>
                  handleColorChange(
                    "Aurora Black Pearl",
                    "images/aurora black pearl.png",
                  )
                }
                className="w-8 h-8 bg-black rounded-full border-2 border-transparent hover:border-black focus:border-black"
              ></button>
            </div>
          </div>
        </div>
      </section>

      {/* Vertical Gallery Section */}
      <section className="py-10 bg-white">
        <div className="container mx-auto flex items-start">
          <div className="w-2/3">
            <img
              id="main-image"
              src={mainImage}
              alt="Main Car"
              className="w-full h-auto rounded-lg shadow-lg"
            />
          </div>
          <div
            className="w-1/3 flex flex-col items-center ml-10 overflow-y-auto h-[500px] space-y-4"
            onScroll={handleScroll}
          >
            {galleryImages.map((src, index) => (
              <img
                key={index}
                src={src}
                className="w-full object-cover rounded-md gallery-image"
                alt={`Gallery Image ${index + 1}`}
              />
            ))}
          </div>
        </div>
      </section>

      {/* GT-Line Section */}
      <section className="relative flex flex-col md:flex-row items-center bg-white text-black h-screen">
        <div id="fade-content" className="w-full md:w-1/2 px-8 md:px-16">
          <h2 className="text-sm font-semibold text-gray-500 uppercase mb-2">
            GT-Line
          </h2>
          <h1 className="text-4xl font-bold text-black mb-6">
            For the show stoppers.
          </h1>
          <p className="text-2xl font-medium text-black mb-6 leading-relaxed">
            The Forte GT-Line arrives with boldly designed front bumper, grille,
            and headlights complete with a head-turning package of available
            style upgrades.
          </p>
          <ul className="list-disc pl-5 space-y-4 text-lg text-gray-700">
            <li>Sport 17-inch alloy wheels, side sills, and rear spoiler</li>
            <li>LED fog lights, tail lights, and daytime running lights</li>
            <li>Sport seats in SynTex and cloth trim</li>
            <li>
              10.25-inch Touchscreen Display w/ Navigation, Kia Connect, &
              SiriusXM� Satellite Radio
            </li>
            <li>Highway Driving Assist</li>
            <li>Navigation-based Smart Cruise Control w/ Stop & Go</li>
            <li>Smart Key w/ Remote Start</li>
            <li>Blind Spot Detection Technology</li>
            <li>Rear Cross-Traffic Collision-Avoidance Assist</li>
          </ul>
          <a href="#" className="text-blue-600 font-semibold mt-4 inline-block">
            Build yours &gt;
          </a>
        </div>
        <div className="w-full md:w-1/2 h-full flex justify-center items-center mb-8">
          <img
            src="images/kia_forte_2024_media-text_GT-line_XXL.jpg"
            alt="GT-Line Car"
            className="object-contain w-[951.5px] h-[950.5px]"
          />
        </div>
      </section>

      {/* Banner Section */}
      <section className="w-full">
        <img
          src="images/Screenshot 2024-12-04 184504.png"
          alt="Banner"
          className="w-full h-auto object-cover"
        />
      </section>

      {/* Performance Section */}
      <section className="py-10 bg-gray-200">
        <div className="container mx-auto flex flex-col md:flex-row items-center justify-between">
          <div>
            <h2 className="text-4xl font-bold">Power you can feel.</h2>
            <p className="mt-2">
              Own the road with 2025 K5s track-inspired performance.
            </p>
            <a
              href="#"
              className="mt-4 inline-block px-6 py-3 bg-blue-600 text-white rounded-lg"
            >
              Explore 2025 K5
            </a>
          </div>
          <div className="text-center mt-6 md:mt-0">
            <h3 className="font-bold text-lg">10-Year/100,000-Mile Warranty</h3>
            <p className="mt-2">Drive like a winner with confidence.</p>
          </div>
        </div>
      </section>
    </div>
  );
};

export default FortePage;

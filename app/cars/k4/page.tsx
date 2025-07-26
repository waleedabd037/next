"use client"
import React from 'react';
import { useState } from 'react';

const K4Page = () => {
    // State for the selected color
    const [selectedColor, setSelectedColor] = useState('Intesteller Grey');
    const [carImage, setCarImage] = useState('/intesteller grey.png');
    const [mainImage, setMainImage] = useState('/my25-k4-in-page-gallery_asset-carousel-2.jpg');

    // Function to change the car color and update the image
    const changeColor = (colorName: string, imagePath: string) => {
        setSelectedColor(colorName);
        setCarImage(imagePath);
    };

    // Gallery Image Scrolling Logic
    const handleScroll = () => {
        const galleryContainer = document.getElementById('gallery-container') as HTMLElement;
        const galleryImages = document.querySelectorAll<HTMLImageElement>('.gallery-image');
        const closestImage = Array.from(galleryImages).reduce((closest, image) => {
            const rect = image.getBoundingClientRect();
            const distance = Math.abs(rect.top - galleryContainer.getBoundingClientRect().top);
            if (distance < closest.distance) {
                return { image, distance };
            }
            return closest;
        }, { image: null as HTMLImageElement | null, distance: Infinity });

        if (closestImage.image) {
            setMainImage(closestImage.image.src);
        }
    };

    return (
        <div className="bg-gray-900">

            {/* Hero Section */}
            <section className="relative h-screen w-full overflow-hidden">
                <img src={carImage} alt="The first-ever K4" className="absolute top-0 left-0 w-full h-full object-cover" />
                <div className="absolute top-1/4 left-10 text-white">
                    <h1 className="text-5xl font-bold mb-6">The first-ever K4</h1>
                    <div className="space-y-6">
                        <div>
                            <p className="text-lg opacity-80">Dual Panoramic Displays w Digital Cockpit</p>
                            <h2 className="text-4xl font-bold">Digital Cockpit</h2>
                        </div>
                        <div>
                            <p className="text-lg opacity-90">11 standard collision-avoidance & driver assist features</p>
                        </div>
                        <div>
                            <p className="text-lg opacity-80">Dual Panoramic Displays</p>
                            <h2 className="text-4xl font-bold">201 hp</h2>
                        </div>
                    </div>
                </div>
            </section>

            {/* Show-Stopping Silhouette Section */}
            <section className="bg-gray-100 flex justify-center items-center min-h-screen">
                <div className="container mx-auto p-6 bg-white rounded-lg shadow-lg text-center">
                    <h1 className="text-4xl font-bold mb-6">A show-stopping silhouette.</h1>
                    <div className="w-full mb-8">
                        <img id="car-image" src={carImage} alt="Car Image" className="mx-auto rounded-lg" />
                    </div>
                    <div>
                        <p className="text-lg font-medium mb-4">
                            Paint: <span id="selected-color" className="font-semibold">{selectedColor}</span>
                        </p>
                        <div className="flex justify-center space-x-4">
                            <button onClick={() => changeColor('Intesteller Grey', 'images/intesteller grey.png')}
                                className="w-8 h-8 bg-gray-400 rounded-full border-2 border-transparent hover:border-black focus:border-black"></button>
                            <button onClick={() => changeColor('Deep Sea Blue', 'images/deep sea blue.png')}
                                className="w-8 h-8 bg-blue-900 rounded-full border-2 border-transparent hover:border-black focus:border-black"></button>
                        </div>
                    </div>
                </div>
            </section>

            {/* Vertical Gallery Section */}
            <section className="py-10 bg-white">
                <div className="container mx-auto flex items-start">
                    <div className="w-2/3">
                        <img id="main-image" src={mainImage} alt="Main Car Image" className="w-full h-auto rounded-lg shadow-lg" />
                    </div>
                    <div className="w-1/3 flex flex-col items-center ml-10">
                        <div className="overflow-y-auto h-[500px] w-full space-y-4" id="gallery-container" onScroll={handleScroll}>
                            <img src="/my25-k4-in-page-gallery_asset-carousel-2.jpg" className="w-full object-cover rounded-md gallery-image" alt="Gallery Image 1" />
                            <img src="/my25-k4-in-page-gallery_asset-carousel-3.jpg" className="w-full object-cover rounded-md gallery-image" alt="Gallery Image 2" />
                            <img src="/my25-k4-in-page-gallery_asset-carousel-5.jpg" className="w-full object-cover rounded-md gallery-image" alt="Gallery Image 3" />
                            <img src="/my25-k4-in-page-gallery_asset-carousel-6.jpg" className="w-full object-cover rounded-md gallery-image" alt="Gallery Image 4" />
                        </div>
                    </div>
                </div>
            </section>

            {/* Upcoming GT-Line Turbo Section */}
            <section className="bg-white py-12">
                <div className="max-w-screen-xl mx-auto flex flex-col md:flex-row items-center">
                    <div className="md:w-1/2 flex justify-center">
                        <img src="/kia-k4-2025-mep-trim-highlight-gt-line-turbo_XXL.jpg" alt="Car Image" className="max-w-full h-auto" />
                    </div>
                    <div className="md:w-1/2 text-center md:text-left px-6">
                        <p className="text-sm uppercase font-semibold text-gray-500 mb-2">Upcoming GT-Line Turbo</p>
                        <h2 className="text-3xl font-bold text-gray-900 mb-4">Power your potential.</h2>
                        <p className="text-gray-600 leading-relaxed">
                            Expected late 2024, the GT-Line Turbo is designed to take the outing to a new level with a turbocharged
                            1.6L engine delivering 190 hp & 195 lb.-ft. of torque. Get inspired on the road and make your presence
                            known with LED cube projector headlights, an ultra-wide sunroof, and Harman Kardon� Audio System.
                        </p>
                    </div>
                </div>
            </section>

            {/* Banner Section */}
            <section className="w-full">
                <img src="/Screenshot 2024-12-04 184504.png" alt="Banner" className="w-full h-auto object-cover" />
            </section>

            {/* Performance Section */}
            <section className="py-10 bg-gray-200">
                <div className="container mx-auto flex flex-col md:flex-row items-center justify-between">
                    <div>
                        <h2 className="text-4xl font-bold">Power you can feel.</h2>
                        <p className="mt-2">Own the road with 2025 K5s track-inspired performance.</p>
                        <a href="#" className="mt-4 inline-block px-6 py-3 bg-blue-600 text-white rounded-lg">Explore 2025 K5</a>
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

export default K4Page;

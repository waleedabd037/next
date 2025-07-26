"use client";

import React, { useRef } from 'react';

const Hero = () => {
  const videoRef = useRef(null);

  return (
    <div className="relative h-screen w-full overflow-hidden">
      {/* Video Background */}
      <video
        ref={videoRef}
        autoPlay
        muted
        loop
        className="absolute top-0 left-0 w-full h-full object-cover"
      >
        <source src="/videoplayback.webm" type="video/webm" />
        Your browser does not support the video tag.
      </video>

      {/* Overlay */}
      <div className="absolute inset-0 bg-black/30" />

      {/* Content */}
      <div className="relative h-full flex flex-col justify-center px-8 max-w-screen-xl mx-auto">
        <div className="space-y-6">
          <h1 className="text-6xl font-bold text-white max-md:text-4xl">
            2025 North American
            <br />
            Car of the Year™
            <br />
            Finalist
          </h1>
          
          <div className="flex gap-4 mt-8">
            <button className="bg-white px-8 py-3 font-medium hover:bg-white/90 transition-colors">
              Meet K4
            </button>
            <button className="bg-transparent border border-white text-white px-8 py-3 font-medium hover:bg-white/10 transition-colors">
              Build Yours
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Hero;
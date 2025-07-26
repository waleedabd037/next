"use client"
import React from 'react';

declare global {
  namespace JSX {
    interface IntrinsicElements {
      'model-viewer': React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & {
          src?: string;
          alt?: string;
          'camera-controls'?: boolean;
          'auto-rotate'?: boolean;
          'rotation-per-second'?: string;
          'min-field-of-view'?: string;
          'max-field-of-view'?: string;
          'min-camera-orbit'?: string;
          'max-camera-orbit'?: string;
          'camera-orbit'?: string;
          'disable-zoom'?: boolean;
          'disable-pan'?: boolean;
          'interaction-prompt'?: string;
          style?: React.CSSProperties;
        },
        HTMLElement
      >;
    }
  }
}

const CarViewer360: React.FC = () => {
  const [activeTab, setActiveTab] = React.useState('exterior');
  const MODEL_PATH = 'model/scene.gltf';


  return (
    <div className="w-full bg-white">
      <div className="max-w-[1400px] mx-auto px-4 md:px-8">
        {/* Header with 360 badge */}
   <div className="pt-10 pb-8">
  <p className="text-sm text-gray-600 max-w-3xl mb-4">
    <span className="font-semibold text-[#05141f]">Note:</span> This section currently features a limited selection of freely available 3D reels. The quality and detail of the reels can be enhanced based on improvements or higher-quality submissions from the client.
  </p>

  <div className="flex items-center gap-3">
    <span className="text-xs font-medium bg-black text-white px-2 py-1 rounded-sm">
      360
    </span>
    <h1 className="text-[32px] sm:text-[36px] lg:text-[42px] font-bold tracking-tight text-[#05141f]">
      Say hello to exploration.
    </h1>
  </div>
</div>



        {/* Navigation Tabs */}
        <div className="flex gap-8 border-b border-[#e5e5e5]">
          <button
            className={`pb-4 relative ${
              activeTab === 'exterior'
                ? 'text-[#05141f] font-semibold'
                : 'text-[#767676] hover:text-[#05141f]'
            }`}
            onClick={() => setActiveTab('exterior')}
          >
            Exterior
            {activeTab === 'exterior' && (
              <div className="absolute bottom-0 left-0 w-full h-[2px] bg-[#bb162b]"></div>
            )}
          </button>
          <button
            className={`pb-4 relative ${
              activeTab === 'interior'
                ? 'text-[#05141f] font-semibold'
                : 'text-[#767676] hover:text-[#05141f]'
            }`}
            onClick={() => setActiveTab('interior')}
          >
            Interior
            {activeTab === 'interior' && (
              <div className="absolute bottom-0 left-0 w-full h-[2px] bg-[#bb162b]"></div>
            )}
          </button>
        </div>

        {/* 3D Viewer */}
        <div className="mt-8 bg-black rounded-lg">
          <model-viewer
            src={MODEL_PATH}
            alt="Kia Sportage 360 View"
            camera-controls={true}
            disable-zoom={true}
            disable-pan={true}
            min-camera-orbit="auto 75deg auto"
            max-camera-orbit="auto 75deg auto"
            camera-orbit="0deg 75deg 105%"
            min-field-of-view="45deg"
            max-field-of-view="45deg"
            interaction-prompt="none"
            style={{
              width: '100%',
              height: '600px',
              backgroundColor: '#000000',
            } as React.CSSProperties}
          />
          
          {/* Drag Indicator */}
          <div className="flex justify-center items-center gap-2 py-4 text-[13px] text-[#767676]">
            <svg className="w-4 h-4 rotate-180" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path d="M9 18L15 12L9 6" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
            </svg>
            Drag To Interact
            <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path d="M9 18L15 12L9 6" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
            </svg>
          </div>
        </div>

        {/* Color Options */}
        <div className="flex justify-between py-8">
          <div>
            <div className="flex items-center gap-2 mb-3">
              <span className="text-[13px] text-[#767676]">Paint:</span>
              <span className="text-[13px] text-[#05141f]">Vesta Blue</span>
            </div>
            <div className="flex gap-2">
              <button className="w-[30px] h-[30px] rounded-full bg-[#c4c4c4] border-2 border-transparent hover:border-[#05141f]"></button>
              <button className="w-[30px] h-[30px] rounded-full bg-[#333333] border-2 border-transparent hover:border-[#05141f]"></button>
              <button className="w-[30px] h-[30px] rounded-full bg-white border-2 border-[#e5e5e5] hover:border-[#05141f]"></button>
              <button className="w-[30px] h-[30px] rounded-full bg-[#1B3665] border-2 border-[#05141f]"></button>
              <button className="w-[30px] h-[30px] rounded-full bg-[#bb162b] border-2 border-transparent hover:border-[#05141f]"></button>
              <button className="w-[30px] h-[30px] rounded-full bg-[#667280] border-2 border-transparent hover:border-[#05141f]"></button>
              <button className="w-[30px] h-[30px] rounded-full bg-[#1a1a1a] border-2 border-transparent hover:border-[#05141f]"></button>
            </div>
          </div>

          <div>
            <div className="flex items-center gap-2 mb-3">
              <span className="text-[13px] text-[#767676]">Seat Trim:</span>
              <span className="text-[13px] text-[#05141f]">Saturn Black Woven Cloth</span>
            </div>
            <div className="flex gap-2">
              <button className="w-[30px] h-[30px] rounded-full bg-black border-2 border-[#05141f]"></button>
              <button className="w-[30px] h-[30px] rounded-full bg-[#424242] border-2 border-transparent hover:border-[#05141f]"></button>
              <button className="w-[30px] h-[30px] rounded-full bg-[#9a9a9a] border-2 border-transparent hover:border-[#05141f]"></button>
              <button className="w-[30px] h-[30px] rounded-full bg-[#2a2a2a] border-2 border-transparent hover:border-[#05141f]"></button>
              <button className="w-[30px] h-[30px] rounded-full bg-[#8B4513] border-2 border-transparent hover:border-[#05141f]"></button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default CarViewer360;
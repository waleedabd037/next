import React from "react";

const Footer = () => {
  return (
    <footer className="bg-black text-white" aria-labelledby="footer-heading">
      <h2 id="footer-heading" className="sr-only">
        Footer
      </h2>
      <div className="mx-auto max-w-screen-2xl px-6 lg:px-8 pt-12 pb-10">
        <div className="xl:grid xl:grid-cols-2 xl:gap-12">
          {/* Tagline Only */}
          <div>
            <p className="text-sm text-gray-400 mb-8">
              Autogen — Driving innovation forward. Explore our lineup of premium cars and unbeatable offers.
            </p>
          </div>

          {/* Navigation Links */}
          <div className="grid grid-cols-2 gap-10 xl:mt-0">
            <div>
              <h3 className="text-base font-semibold text-white-400">Vehicles</h3>
              <ul className="mt-4 space-y-3">
                <li><a href="#" className="text-sm hover:text-white">All Models</a></li>
                <li><a href="#" className="text-sm hover:text-white">Electric</a></li>
                <li><a href="#" className="text-sm hover:text-white">SUVs</a></li>
                <li><a href="#" className="text-sm hover:text-white">Sedans</a></li>
              </ul>
            </div>
            <div>
              <h3 className="text-base font-semibold text-white-400">Support</h3>
              <ul className="mt-4 space-y-3">
                <li><a href="#" className="text-sm hover:text-white">Contact Us</a></li>
                <li><a href="#" className="text-sm hover:text-white">Service Centers</a></li>
                <li><a href="#" className="text-sm hover:text-white">Warranty</a></li>
                <li><a href="#" className="text-sm hover:text-white">FAQs</a></li>
              </ul>
            </div>
          </div>
        </div>

        {/* Bottom line */}
        <div className="mt-10 border-t border-gray-700 pt-6 text-center text-sm text-gray-500">
          &copy; {new Date().getFullYear()} Autogen. All rights reserved.
        </div>
      </div>
    </footer>
  );
};

export default Footer;

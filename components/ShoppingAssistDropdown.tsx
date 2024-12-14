"use client";

import React from "react";
import Link from "next/link";
import { FaTimes } from "react-icons/fa";

interface ShoppingAssistDropdownProps {
    options: { name: string; description: string }[]; // Array of shopping assist options (name and description only)
    isOpen: boolean;
    closeDropdown: () => void;
    handleOptionClick: () => void;
}

const ShoppingAssistDropdown: React.FC<ShoppingAssistDropdownProps> = ({
    options,
    isOpen,
    closeDropdown,
    handleOptionClick,
}) => {
    if (!isOpen) return null;

    return (
        <div className="absolute top-16 left-0 w-full h-[calc(100vh-64px)] bg-white text-black z-50 py-8 px-12 overflow-auto">
            <button
                onClick={closeDropdown}
                className="absolute top-4 right-4 text-2xl text-black"
            >
                <FaTimes />
            </button>

            <div className="flex flex-col space-y-8">
                {options.map((option, index) => {
                    // We define the link internally based on the option name
                    const link = `/assist/${option.name.toLowerCase().replace(/\s+/g, '-')}`;

                    return (
                        <div key={index} className="space-y-4">
                            <h3 className="text-xl font-bold">{option.name}</h3>
                            <p className="text-sm text-gray-600">{option.description}</p>
                            <Link href={link} passHref>
                                <button
                                    onClick={handleOptionClick}
                                    className="mt-2 py-2 px-4 bg-blue-600 text-white rounded-md hover:bg-blue-700"
                                >
                                    Go to {option.name}
                                </button>
                            </Link>
                        </div>
                    );
                })}
            </div>
        </div>
    );
};

export default ShoppingAssistDropdown;

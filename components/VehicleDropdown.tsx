import React from "react";
import Link from "next/link";
import { FaTimes } from "react-icons/fa";

interface DropdownProps {
    categories: {
        name: string;
        vehicles: { name: string; image: string }[];
    }[];
    isOpen: boolean;
    closeDropdown: () => void;
    handleVehicleClick: () => void;
}

const VehicleDropdown: React.FC<DropdownProps> = ({ categories, isOpen, closeDropdown, handleVehicleClick }) => {
    if (!isOpen) return null;

    return (
        <div className="absolute top-16 left-0 w-full bg-white text-black z-50 py-8 px-12 overflow-auto h-[calc(100vh-64px)]">
            <button
                onClick={closeDropdown}
                className="absolute top-4 right-4 text-2xl text-black"
            >
                <FaTimes />
            </button>

            <div className="flex flex-col space-y-8">
                {categories.map((category, index) => (
                    <div key={index} className="space-y-4">
                        <h3 className="text-xl font-bold">{category.name}</h3>
                        <div className="flex space-x-8 overflow-x-auto">
                            {category.vehicles.map((vehicle, vehicleIndex) => (
                                <div
                                    key={vehicleIndex}
                                    className="flex-shrink-0 w-48 text-center"
                                >
                                    <Link
                                        href={`/cars/${vehicle.image
                                            .replace("/", "")
                                            .replace(/\s+/g, "-")
                                            .toLowerCase()
                                            .replace(/\.(jpg|png)/, "")}`}
                                    >
                                        <div onClick={handleVehicleClick}>
                                            <img
                                                src={vehicle.image}
                                                alt={vehicle.name}
                                                className="w-full h-32 object-cover rounded-md shadow-md"
                                            />
                                            <p className="mt-2 text-sm font-medium">{vehicle.name}</p>
                                        </div>
                                    </Link>
                                </div>
                            ))}
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
};

export default VehicleDropdown;

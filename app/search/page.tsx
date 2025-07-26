import { ProductItem, SectionTitle } from "@/components";
import React from "react";

interface Props {
  searchParams: { search: string };
}

const SearchPage = async ({ searchParams: { search } }: Props) => {
  const data = await fetch(
    `http://localhost:3001/api/search?query=${search || ""}`
  );

  const products = await data.json();

  return (
    <div className="min-h-screen">
      {/* Top gradient header section */}
      <div className="bg-gradient-to-b from-gray-800 via-gray-900 to-black text-white pb-10">
        {search && (
          <h3 className="text-4xl text-center py-10 max-sm:text-3xl">
            Showing results for <span >{search}</span>
          </h3>
        )}
      </div>

      {/* White background for results */}
      <div className="bg-white pt-10 pb-20">
        <div className="max-w-screen-2xl mx-auto">
          <div className="grid grid-cols-4 justify-items-center gap-x-2 gap-y-5 max-[1300px]:grid-cols-3 max-lg:grid-cols-2 max-[500px]:grid-cols-1">
            {products.length > 0 ? (
              products.map((product: Product) => (
                <ProductItem key={product.id} product={product} color="black" />
              ))
            ) : (
              <h3 className="text-3xl mt-5 text-center w-full col-span-full max-[1000px]:text-2xl max-[500px]:text-lg text-gray-600">
                No products found for specified query
              </h3>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default SearchPage;

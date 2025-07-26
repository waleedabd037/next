"use client";
import { nanoid } from "nanoid";
import Image from "next/image";
import Link from "next/link";
import React, { useEffect, useState } from "react";
import CustomButton from "./CustomButton";

const DashboardProductTable = () => {
  const [products, setProducts] = useState<Product[]>([]);

  useEffect(() => {
    fetch("http://localhost:3001/api/products?mode=admin", {
      cache: "no-store",
    })
      .then((res) => {
        return res.json();
      })
      .then((data) => {
        setProducts(data);
      });
  }, []);

  return (
    <div className="w-full">
      <h1 className="text-3xl font-semibold text-center mb-5">All products</h1>
      <div className="ml-10">
  <Link href="/admin/products/new">
    <button
      type="button"
      className="px-10 py-5 text-base bg-gradient-to-b from-gray-800 via-gray-900 to-black text-white rounded hover:bg-gradient-to-b hover:from-gray-700 hover:via-gray-800 hover:to-gray-900"
    >
      Add new product
    </button>
  </Link>
</div>


      <div className="xl:ml-5 max-xl:mt-5 overflow-auto h-[80vh]">
        <table className="table table-md table-pin-cols">
          {/* head */}
          <thead>
            <tr>
              <th>
                <label>
                  <input type="checkbox" className="checkbox" />
                </label>
              </th>
              <th>Product</th>
              <th>Stock Availability</th>
              <th>Price</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {/* row 1 */}
            {products &&
              products.map((product) => (
                <tr key={nanoid()}>
                  <th>
                    <label>
                      <input type="checkbox" className="checkbox" />
                    </label>
                  </th>

                  <td className="min-w-[220px]">
                    <div className="flex items-center gap-3">
                      <div className="avatar">
                        <div className="w-12 h-12 flex items-center justify-center border rounded">
                          <Image
                            src={
                              product?.mainImage
                                ? `/${product?.mainImage}`
                                : "/product_placeholder.jpg"
                            }
                            alt="Product"
                            width={55}
                            height={48}
                            className="object-contain w-full h-full"
                          />
                        </div>
                      </div>

                      <div>
                        <div className="font-bold">{product?.title}</div>
                        <div className="text-sm opacity-50">
                          {product?.manufacturer}
                        </div>
                      </div>
                    </div>
                  </td>

                  <td>
                    {product?.inStock ? (
                      <span className="badge badge-success text-white badge-sm">
                        In stock
                      </span>
                    ) : (
                      <span className="badge badge-error text-white badge-sm">
                        Out of stock
                      </span>
                    )}
                  </td>
                  <td>${product?.price}</td>
                  <th>
                    <Link
                      href={`/admin/products/${product.id}`}
                      className="btn btn-ghost btn-xs"
                    >
                      details
                    </Link>
                  </th>
                </tr>
              ))}
          </tbody>
          {/* foot */}
          <tfoot>
            <tr>
              <th></th>
              <th>Product</th>
              <th>Stock Availability</th>
              <th>Price</th>
              <th></th>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>
  );
};

export default DashboardProductTable;

"use client";

import React from "react";
import Image from "next/image";

const OrderSummary = ({ products, total }: any) => {
  return (
    <div className="mx-auto max-w-lg lg:max-w-none">
      <h2 id="summary-heading" className="text-lg font-medium text-gray-900">
        Order summary
      </h2>
      <ul className="divide-y divide-gray-200 text-sm font-medium text-gray-900">
        {products.map((product: any) => (
          <li key={product.id} className="flex items-start space-x-4 py-6">
            <Image
              src={product.mainImage}
              alt={product.name}
              width={80}
              height={80}
              className="h-20 w-20 flex-none rounded-md object-cover object-center"
            />
            <div className="flex-auto space-y-1">
              <h3>{product.title}</h3>
              <p className="text-gray-500">x{product.amount}</p>
            </div>
            <p className="flex-none text-base font-medium">${product.price}</p>
          </li>
        ))}
      </ul>

      <dl className="hidden space-y-6 border-t border-gray-200 pt-6 text-sm font-medium text-gray-900 lg:block">
        <div className="flex items-center justify-between">
          <dt className="text-gray-600">Subtotal</dt>
          <dd>${total}</dd>
        </div>
        <div className="flex items-center justify-between">
          <dt className="text-gray-600">Shipping</dt>
          <dd>$5</dd>
        </div>
        <div className="flex items-center justify-between">
          <dt className="text-gray-600">Taxes</dt>
          <dd>${total / 5}</dd>
        </div>
        <div className="flex items-center justify-between border-t border-gray-200 pt-6">
          <dt className="text-base">Total</dt>
          <dd className="text-base">
            ${total === 0 ? 0 : Math.round(total + total / 5 + 5)}
          </dd>
        </div>
      </dl>
    </div>
  );
};

export default OrderSummary;

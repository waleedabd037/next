'use client';
import { DashboardSidebar } from '@/components';
import { convertCategoryNameToURLFriendly as convertSlugToURLFriendly } from '@/utils/categoryFormating';
import { supabase } from '@/utils/supabase';
import Image from 'next/image';
import React, { useEffect, useState } from 'react';
import toast from 'react-hot-toast';

const AddNewProduct = () => {
  const [product, setProduct] = useState<{
    id?: string;
    title: string;
    price: number;
    manufacturer: string;
    inStock: number;
    mainImage: string;
    description: string;
    slug: string;
    categoryId: string;
  }>({
    id: '',
    title: '',
    price: 0,
    manufacturer: '',
    inStock: 1,
    mainImage: '',
    description: '',
    slug: '',
    categoryId: '',
  });

  const [categories, setCategories] = useState<Category[]>([]);

  const addProduct = async () => {
    if (
      product.title === '' ||
      product.manufacturer === '' ||
      product.description === '' ||
      product.slug === '' ||
      product.mainImage === ''
    ) {
      toast.error('Please enter all required fields');
      return;
    }

    const requestOptions: any = {
      method: 'post',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(product),
    };

    fetch(`http://localhost:3001/api/products`, requestOptions)
      .then((response) => {
        if (response.status === 201) {
          return response.json();
        } else {
          throw Error('There was an error while creating product');
        }
      })
      .then((data) => {
        toast.success('Product added successfully');
        setProduct({
          id: '',
          title: '',
          price: 0,
          manufacturer: '',
          inStock: 1,
          mainImage: '',
          description: '',
          slug: '',
          categoryId: categories[0]?.id || '',
        });
      })
      .catch(() => {
        toast.error('There was an error while creating product');
      });
  };

  const uploadFile = async (file: File) => {
    const fileExt = file.name.split('.').pop();
    const fileName = `${Date.now()}.${fileExt}`;

    const { data, error } = await supabase.storage
      .from('product-images')
      .upload(fileName, file, {
        cacheControl: '3600',
        upsert: false,
      });

    if (error) {
      console.error('Upload failed:', error.message);
      toast.error('Failed to upload image');
      return;
    }

    const { data: publicUrlData } = supabase
  .storage
  .from('product-images')
  .getPublicUrl(fileName);

if (!publicUrlData?.publicUrl) {
  toast.error('Could not retrieve image URL');
  return;
}

setProduct((prev) => ({ ...prev, mainImage: publicUrlData.publicUrl }));

    toast.success('Image uploaded');
  };

  const fetchCategories = async () => {
    fetch(`http://localhost:3001/api/categories`)
      .then((res) => res.json())
      .then((data) => {
        setCategories(data);
        setProduct((prev) => ({
          ...prev,
          categoryId: data[0]?.id || '',
        }));
      });
  };

  useEffect(() => {
    fetchCategories();
  }, []);

  return (
    <div className="bg-white flex justify-start max-w-screen-2xl mx-auto xl:h-full max-xl:flex-col max-xl:gap-y-5">
      <DashboardSidebar />
      <div className="flex flex-col gap-y-7 xl:ml-5 max-xl:px-5 w-full">
        <h1 className="text-3xl font-semibold">Add new product</h1>

        {/* Title */}
        <div>
          <label className="form-control w-full max-w-xs">
            <div className="label">
              <span className="label-text">Product name:</span>
            </div>
            <input
              type="text"
              className="input input-bordered w-full max-w-xs"
              value={product.title}
              onChange={(e) =>
                setProduct({ ...product, title: e.target.value })
              }
            />
          </label>
        </div>

        {/* Slug */}
        <div>
          <label className="form-control w-full max-w-xs">
            <div className="label">
              <span className="label-text">Product slug:</span>
            </div>
            <input
              type="text"
              className="input input-bordered w-full max-w-xs"
              value={convertSlugToURLFriendly(product.slug)}
              onChange={(e) =>
                setProduct({
                  ...product,
                  slug: convertSlugToURLFriendly(e.target.value),
                })
              }
            />
          </label>
        </div>

        {/* Category */}
        <div>
          <label className="form-control w-full max-w-xs">
            <div className="label">
              <span className="label-text">Category:</span>
            </div>
            <select
              className="select select-bordered"
              value={product.categoryId}
              onChange={(e) =>
                setProduct({ ...product, categoryId: e.target.value })
              }
            >
              {categories.map((category) => (
                <option key={category.id} value={category.id}>
                  {category.name}
                </option>
              ))}
            </select>
          </label>
        </div>

        {/* Custom ID */}
        <div>
          <label className="form-control w-full max-w-xs">
            <div className="label">
              <span className="label-text">Product ID (custom):</span>
            </div>
            <input
              type="text"
              className="input input-bordered w-full max-w-xs"
              value={product.id || ''}
              onChange={(e) =>
                setProduct({ ...product, id: e.target.value })
              }
            />
          </label>
        </div>

        {/* Price */}
        <div>
          <label className="form-control w-full max-w-xs">
            <div className="label">
              <span className="label-text">Product price:</span>
            </div>
            <input
              type="text"
              className="input input-bordered w-full max-w-xs"
              value={product.price}
              onChange={(e) =>
                setProduct({ ...product, price: Number(e.target.value) })
              }
            />
          </label>
        </div>

        {/* Manufacturer */}
        <div>
          <label className="form-control w-full max-w-xs">
            <div className="label">
              <span className="label-text">Manufacturer:</span>
            </div>
            <input
              type="text"
              className="input input-bordered w-full max-w-xs"
              value={product.manufacturer}
              onChange={(e) =>
                setProduct({ ...product, manufacturer: e.target.value })
              }
            />
          </label>
        </div>

        {/* In Stock */}
        <div>
          <label className="form-control w-full max-w-xs">
            <div className="label">
              <span className="label-text">Is product in stock?</span>
            </div>
            <select
              className="select select-bordered"
              value={product.inStock}
              onChange={(e) =>
                setProduct({ ...product, inStock: Number(e.target.value) })
              }
            >
              <option value={1}>Yes</option>
              <option value={0}>No</option>
            </select>
          </label>
        </div>

        {/* Upload image */}
        <div>
          <input
            type="file"
            className="file-input file-input-bordered file-input-lg w-full max-w-sm"
            onChange={(e) => {
              const file = e.target.files?.[0];
              if (file) {
                uploadFile(file);
              }
            }}
          />
          {product.mainImage && (
            <Image
              src={product.mainImage}
              alt={product.title}
              className="w-auto h-auto mt-4"
              width={100}
              height={100}
            />
          )}
        </div>

        {/* Description */}
        <div>
          <label className="form-control">
            <div className="label">
              <span className="label-text">Product description:</span>
            </div>
            <textarea
              className="textarea textarea-bordered h-24"
              value={product.description}
              onChange={(e) =>
                setProduct({ ...product, description: e.target.value })
              }
            ></textarea>
          </label>
        </div>

        {/* Submit button */}
        <div className="flex gap-x-2 mb-4">
          <button
            onClick={addProduct}
            type="button"
            className="uppercase bg-black px-10 py-5 text-lg border border-black border-gray-300 font-bold text-white shadow-sm hover:bg-blue-600 hover:text-white focus:outline-none focus:ring-2"
          >
            Add product
          </button>
        </div>
      </div>
    </div>
  );
};

export default AddNewProduct;

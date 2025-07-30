import React from 'react';
import SingleProductClient from '@/components/SingleProductClient';

interface SingleProductPageProps {
  params: { productSlug: string };
}

const SingleProductPage = ({ params }: SingleProductPageProps) => {
  return <SingleProductClient slug={params.productSlug} />;
};

export default SingleProductPage;

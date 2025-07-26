import { CategoryMenu, Hero, Incentives, IntroducingSection, Newsletter, ProductsSection } from "@/components";
import ProductImagesBanner from "@/components/ProductImagesBanner";
import CarViewer360 from '@/components/reel';
export default function Home() {
  return (
    <>
     
    <Hero />
    <IntroducingSection />
    <CarViewer360 />

    <ProductsSection />
    </>
  );
}

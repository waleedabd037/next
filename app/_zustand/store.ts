import { create } from "zustand";
import { persist, createJSONStorage } from "zustand/middleware";

export type ProductInCart = {
  id: string;
  title: string;
  price: number;
  image: string;
  amount: number;
  mainImage: string;
  name: string;
};

export type State = {
  products: ProductInCart[];
  allQuantity: number;
  total: number;
  hasHydrated: boolean;
};

export type Actions = {
  addToCart: (newProduct: ProductInCart) => void;
  removeFromCart: (id: string) => void;
  updateCartAmount: (id: string, quantity: number) => void;
  calculateTotals: () => void;
  clearCart: () => void;
  setHasHydrated: (value: boolean) => void;
};

export const useProductStore = create<State & Actions>()(
  persist(
    (set, get) => ({
      products: [],
      allQuantity: 0,
      total: 0,
      hasHydrated: false,
      setHasHydrated: (value: boolean) => {
        set({ hasHydrated: value });
      },
      addToCart: (newProduct) => {
        set((state) => {
          const cartItem = state.products.find(
            (item) => item.id === newProduct.id
          );
          if (!cartItem) {
            return { products: [...state.products, newProduct] };
          } else {
            const updatedProducts = state.products.map((product) =>
              product.id === cartItem.id
                ? { ...product, amount: product.amount + newProduct.amount }
                : product
            );
            return { products: updatedProducts };
          }
        });
      },
      removeFromCart: (id) => {
        set((state) => ({
          products: state.products.filter((p) => p.id !== id),
        }));
      },
      updateCartAmount: (id, amount) => {
        set((state) => {
          const updatedProducts = state.products.map((product) =>
            product.id === id ? { ...product, amount } : product
          );
          return { products: updatedProducts };
        });
      },
      calculateTotals: () => {
        set((state) => {
          let amount = 0;
          let total = 0;
          state.products.forEach((item) => {
            amount += item.amount;
            total += item.amount * item.price;
          });
          return {
            allQuantity: amount,
            total: total,
          };
        });
      },
      clearCart: () => {
        set({
          products: [],
          allQuantity: 0,
          total: 0,
        });
      },
    }),
    {
      name: "products-storage",
      storage: createJSONStorage(() => sessionStorage),
      onRehydrateStorage: () => (state) => {
        state?.setHasHydrated(true);
      },
    }
  )
);

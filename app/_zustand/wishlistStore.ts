import { create } from "zustand";
import { persist } from "zustand/middleware";

export type ProductInWishlist = {
  id: string;
  title: string;
  price: number;
  image: string;
  mainImage: string;
  slug: string;
  stockAvailabillity: number;
};

export type State = {
  wishlist: ProductInWishlist[];
  wishQuantity: number;
};

export type Actions = {
  addToWishlist: (product: ProductInWishlist) => void;
  removeFromWishlist: (id: string) => void;
  setWishlist: (wishlist: ProductInWishlist[]) => void;
};

export const useWishlistStore = create<State & Actions>()(
  persist(
    (set) => ({
      wishlist: [],
      wishQuantity: 0,

      addToWishlist: (product) => {
        set((state) => {
          const exists = state.wishlist.find((item) => item.id === product.id);
          if (!exists) {
            const newWishlist = [...state.wishlist, product];
            return { wishlist: newWishlist, wishQuantity: newWishlist.length };
          }
          return state;
        });
      },

      removeFromWishlist: (id) => {
        set((state) => {
          const newWishlist = state.wishlist.filter((item) => item.id !== id);
          return { wishlist: newWishlist, wishQuantity: newWishlist.length };
        });
      },

      setWishlist: (wishlist) => {
        set(() => ({
          wishlist: [...wishlist],
          wishQuantity: wishlist.length,
        }));
      },
    }),
    {
      name: "wishlist-storage",
    }
  )
);

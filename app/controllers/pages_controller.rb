class PagesController < ApplicationController
    before_action :authenticate_user!
    
    def home  
    end

    def check_out
        @cart = current_user.cart
        
    end

    def remove_cart_product
        @cart = current_user.cart
        cart_product = CartProduct.find(params[:id])
        cart_product = cart_product.destroy
        cart_product.save
        total_price = (@cart.total_price - (cart_product.product.cost * cart_product.quantity))
        @cart.update_attribute(:total_price, total_price)
        redirect_to home_path
      end
    
      def add_one
        @cart = current_user.cart
        cart_product = CartProduct.find(params[:id])
        cart_product.quantity = cart_product.quantity + 1
        cart_product.save
        total_price = (@cart.total_price + cart_product.product.cost)
        @cart.update_attribute(:total_price, total_price)
        redirect_to home_path
      end
    
      #need help with this
      def total_cost
        cost = 0
        @cart = current_user.cart
        @cart.cart_products.each do |cart_product|
          total_cost = (cart_product.product.cost * cart_product.quantity + cost)
        end
        return total_cost 
      end

end

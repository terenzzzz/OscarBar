class BuyersController < ApplicationController
    before_action :authenticate_user!

    def index
        @products = Product.all
        @cocktail = Product.where(category_id:"1")
        @whisky = Product.where(category_id:"2")
        
        
    end


    def add_cart
        @cart = current_user.cart
        @product = Product.find(params[:id])
        cart_product = @cart.cart_products.where(add_to_cart_params.merge(product: @product)).first_or_create
        cart_product.quantity = (cart_product.quantity + 1)
        cart_product.save
        total_price = (@cart.total_price + cart_product.product.price)
        @cart.update_attribute(:total_price, total_price)
        redirect_to buyers_path
      end

    



    def add_to_cart_params
      params.fetch(:cart_product, {}).permit(:pick_colour,:pick_size)
    end


end
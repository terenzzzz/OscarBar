class BuyersController < ApplicationController
    before_action :authenticate_user!

    def index
        OrderMailer.with(user: current_user).order_create_email.deliver_later
        @products = Product.all
        @cocktail = Product.where(category_id:"1")
        @whisky = Product.where(category_id:"2")

        total_quantity = 0
        if current_user.cart == nil
          @cart = current_user.create_cart
          @cart.update_attribute(:total_price, 0)
        end
        
        @cart_products = current_user.cart.cart_products
        @cart_products.each do |cart_product|
          total_quantity = total_quantity + cart_product.quantity    
        end
        @total_quantity = total_quantity
        
    end
    
    def create_cart
      @cart = current_user.create_cart
      redirect_to "/"
    end

    def add_cart
        @cart = current_user.cart
        @product = Product.find(params[:id])
        cart_product = @cart.cart_products.where(add_to_cart_params.merge(product: @product)).first_or_create
        cart_product.quantity = (cart_product.quantity + 1)
        cart_product.save
        total_price = (@cart.total_price + cart_product.product.price)
        @cart.update_attribute(:total_price, total_price)
        redirect_to buyers_path, notice:'加入购物车成功'
      end

    



    def add_to_cart_params
      params.fetch(:cart_product, {}).permit(:pick_colour,:pick_size)
    end


end
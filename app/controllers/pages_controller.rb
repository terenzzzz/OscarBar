class PagesController < ApplicationController
    before_action :authenticate_user!, except: [:home]
    
    def home  
      if user_signed_in?
        if session[:role] == 'Admin'
          redirect_to admins_path
        else
          redirect_to buyers_path
        end
      else
        root_path
        @products = Product.all
        @cocktail = Product.where(category_id:"1")
        @whisky = Product.where(category_id:"2")
      end

    end

    def check_out
        @cart = current_user.cart
        if session[:newOrder] == "Created"
          @order = Order.where(user_id: current_user.id, total_price: @cart.total_price).last
        end

        @payments = Payment.all
        @rate = Rate.first.exchange_rate
        @rmb = (@cart.total_price * @rate).round(2)
        
    end

    def remove_cart_product
        @cart = current_user.cart
        cart_product = CartProduct.find(params[:id])
        cart_product = cart_product.destroy
        cart_product.save
        total_price = (@cart.total_price - (cart_product.product.price * cart_product.quantity))
        @cart.update_attribute(:total_price, total_price.round(2))
        redirect_to check_out_pages_path
      end
    
      def add_one
        @cart = current_user.cart
        cart_product = CartProduct.find(params[:id])
        cart_product.quantity = cart_product.quantity + 1
        cart_product.save
        total_price = (@cart.total_price + cart_product.product.price)
        @cart.update_attribute(:total_price, total_price.round(2))
        redirect_to check_out_pages_path
      end

      def reduce_one
        @cart = current_user.cart
        cart_product = CartProduct.find(params[:id])
        if cart_product.quantity > 1
          cart_product.quantity = cart_product.quantity - 1
          cart_product.save
          total_price = (@cart.total_price - cart_product.product.price)
          @cart.update_attribute(:total_price, total_price.round(2))
          redirect_to check_out_pages_path
        else
          @cart = current_user.cart
          cart_product = CartProduct.find(params[:id])
          cart_product = cart_product.destroy
          cart_product.save
          total_price = (@cart.total_price - (cart_product.product.price * cart_product.quantity))
          @cart.update_attribute(:total_price, total_price.round(2))
          redirect_to check_out_pages_path
        end

      end
    
      def orderConfirm
        @cart = current_user.cart
        @cart_products = @cart.cart_products

        goods = ''
        @cart_products.each do |cart_product|
            goods =  goods +  ' ' + (Product.find(cart_product.product_id).name + ' X' + cart_product.quantity.to_s)
        end

        @product_string = goods
        if session[:newOrder] = "Created"
          @order = Order.where(user_id: current_user.id).last
          @cart_products.each do |car_product|
            OrderProduct.create(order_id: @order.id, product_id: car_product.product_id, quantity: car_product.quantity )
          end
          @cart.destroy
          session[:newOrder] = nil
          OrderMailer.with(user: current_user, products:@product_string ).new_order_email.deliver_later
          redirect_to '/pages/home',notice:"订单提交成功"
          
        else
          redirect_to '/pages/check_out',notice:"请先支付订单并上传截图"
        end

        
      end

      # def total_cost
      #   cost = 0
      #   @cart = current_user.cart
      #   @cart.cart_products.each do |cart_product|
      #     total_cost = (cart_product.product.price * cart_product.quantity + cost)
      #   end
      #   return total_cost 
      # end

end

class OrdersController < ApplicationController
    before_action :authenticate_user!

    def admin_orders
        @orders = Order.all
    end

    def full_order
        @order = Order.find(params[:id])
        @order_products = @order.order_products
        @user = User.find(@order.user_id)
        @rate = Rate.first.exchange_rate
        @rmb = (@order.total_price * @rate).round(2)
    end


end

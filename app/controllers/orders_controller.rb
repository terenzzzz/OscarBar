class OrdersController < ApplicationController
    before_action :authenticate_user!

    def admin_orders
        @orders = Order.all
    end



end

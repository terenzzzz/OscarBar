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

    def buyer_orders
        @orders = Order.where(user_id: current_user.id)
    end

    def edit
        if session[:newOrder] = "Created"
            @order = Order.where(user_id: current_user.id).last
        end

    end

    def update
        @order = Order.where(user_id: current_user.id).last
        if @order.update(order_params)
          redirect_to '/pages/check_out', notice: '截图上传成功'
        else
          render :edit
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
            @order = Order.find(params[:id])
        end
        # Only allow a list of trusted parameters through.
        def order_params
            params.require(:order).permit(:transferent)
        end

    end

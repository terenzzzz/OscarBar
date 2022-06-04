class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  def index
    @rate = Rate.first
    @payments = Payment.all
  end

  # GET /payments/1
  def show
    @cart = current_user.cart
    @rate = Rate.first.exchange_rate
    @rmb = (@cart.total_price * @rate).round(2)
    if session[:role] == 'User'
      @temperate = Temperate.create(user_id: current_user.id)
      session[:transferent] = 'created'
      @total = @cart.total_price
    end

  end

  def choose_payment
    @payments = Payment.all
  end

  def cancel_payment
    # @cart = current_user.cart
    if session[:transferent] = 'created'
      @order_to_cencel = Temperate.where(user_id: current_user.id).last
      @order_to_cencel.destroy
      session[:transferent] = 'nil'
    end
      redirect_to '/payments/choose_payment'
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      redirect_to payments_path, notice: '支付方式添加成功'
    else
      render :new
    end
  end

  # PATCH/PUT /payments/1
  def update
    if @payment.update(payment_params)
      redirect_to payments_path, notice: '支付方式更新成功'
    else
      render :edit
    end
  end

  # DELETE /payments/1
  def destroy
    @payment.destroy
    redirect_to payments_url, notice: '支付方式删除成功'
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:name, :proof)
    end
end

class OrderMailer < ApplicationMailer
    default from: 'OscarBar@noreply.com'

    def order_create_email
        @user = params[:user]
        @products = params[:products]
        mail(to: @user.email, subject: '订单已下达')
    end

    def new_order_email
        @user = params[:user]
        @products = params[:products]
        mail(to: 'terence592592@gmail.com', subject: 'Oscarbar新订单')
    end
end

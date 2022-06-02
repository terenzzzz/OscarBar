class OrderMailer < ApplicationMailer
    default from: 'OscarBar'

    def order_create_email
        @user = params[:user]
        @products = params[:products]
        mail(to: @user.email, subject: 'Order have been placed')
    end
end

class OrderMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def order_create_email
        @user = params[:user]
        mail(to: @user.email, subject: 'Order have been placed')
    end
end

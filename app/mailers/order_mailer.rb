class OrderMailer < ApplicationMailer
    default from: 'OscarBar'

    def order_create_email
        @user = params[:user]
        @products =params[:products]

        goods = ''
        @products.each do |product|
            goods =  goods +  ' ' + (Product.find(product.product_id).name + ' X' + product.quantity.to_s)
        end

        @productList = goods
        
        mail(to: @user.email, subject: 'Order have been placed')
    end
end

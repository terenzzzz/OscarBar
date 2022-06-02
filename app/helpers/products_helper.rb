module ProductsHelper
    def getProduct(order_products)
        goods = ''
        order_products.each do |order_product|
            goods =  goods +  ' ' + (Product.find(order_product.product_id).name + 'X' + order_product.quantity.to_s)
        end
        return goods
    end


end

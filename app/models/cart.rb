class Cart < ApplicationRecord

    belongs_to :user

    has_many :cart_products, dependent: :destroy
    has_many :products, through: :cart_products


    def quantity_count(current_user)
        total = 0
        current_user.cart.cart_products do |product|
            total = total + product.quantity
        return total
        end
    end
    
            
end

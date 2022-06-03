# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
class Product < ApplicationRecord
    has_many_attached :images
    belongs_to :category

    has_many :cart_products, dependent: :destroy
    has_many :carts, through: :cart_products

    has_many :order_products, dependent: :destroy
    has_many :order, through: :cart_products
end

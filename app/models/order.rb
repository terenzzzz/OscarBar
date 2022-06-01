# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  total_price :float
#
class Order < ApplicationRecord
    belongs_to :user

    has_many :order_products, dependent: :destroy
    has_many :products, through: :order_products
end

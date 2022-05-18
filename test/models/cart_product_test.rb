# == Schema Information
#
# Table name: cart_products
#
#  id         :bigint           not null, primary key
#  cart_id    :bigint           not null
#  product_id :bigint           not null
#  quantity   :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CartProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

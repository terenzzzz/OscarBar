# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  total_price  :float
#  temperate_id :bigint
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

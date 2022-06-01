# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Payment < ApplicationRecord
    has_one_attached :proof
end

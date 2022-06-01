# == Schema Information
#
# Table name: rates
#
#  id            :bigint           not null, primary key
#  exchange_rate :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Rate < ApplicationRecord
end

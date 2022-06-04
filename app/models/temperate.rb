# == Schema Information
#
# Table name: temperates
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Temperate < ApplicationRecord
    
    has_one_attached :temp_transferent
end

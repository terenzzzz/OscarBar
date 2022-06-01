class Payment < ApplicationRecord
    has_one_attached :proof
end

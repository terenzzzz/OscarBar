class AddTemperateIdToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :temperate, foreign_key: true
  end
end

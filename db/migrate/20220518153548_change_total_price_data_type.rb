class ChangeTotalPriceDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :carts, :total_price, :float
  end
end

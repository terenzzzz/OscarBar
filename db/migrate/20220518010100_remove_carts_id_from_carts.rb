class RemoveCartsIdFromCarts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :carts, :carts, foreign_key: true
  end
end

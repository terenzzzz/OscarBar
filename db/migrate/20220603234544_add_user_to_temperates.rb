class AddUserToTemperates < ActiveRecord::Migration[6.1]
  def change
    add_column :temperates, :user_id, :integer
  end
end

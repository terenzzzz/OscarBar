class AddContentToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile, :string
    add_column :users, :wechat, :string
    add_column :users, :apartment, :string
  end
end

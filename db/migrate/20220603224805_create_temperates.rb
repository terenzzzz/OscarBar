class CreateTemperates < ActiveRecord::Migration[6.1]
  def change
    create_table :temperates do |t|

      t.timestamps
    end
  end
end

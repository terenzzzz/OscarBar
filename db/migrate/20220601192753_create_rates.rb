class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.float :exchange_rate

      t.timestamps
    end
  end
end

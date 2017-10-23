class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.decimal :price_range, null: false
      t.integer :total_seats, null: false
      t.time :open_hour, null: false
      t.time :close_hour, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end

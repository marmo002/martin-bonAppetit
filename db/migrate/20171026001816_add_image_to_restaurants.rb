class AddImageToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :image, :string, null: false

    add_column :restaurants, :twitter_handle, :string
  end
end

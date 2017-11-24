class AddImageToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :image, :string

    add_column :restaurants, :twitter_handle, :string
  end
end

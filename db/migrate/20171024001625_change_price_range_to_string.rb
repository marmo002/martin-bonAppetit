class ChangePriceRangeToString < ActiveRecord::Migration[5.1]
  def up
    change_table :restaurants do |t|
      t.change :price_range, :string, null: false
    end
  end
  def down
    change_table :restaurants do |t|
      t.change :price_range, :decimal
    end
  end
end

class RemoveIsAdminFromUsers < ActiveRecord::Migration[5.1]
  def up
    remove_column :users, :is_admin
  end

  def down
    add_column :users, :is_admin, :boolean, null: false, default: false
  end
end

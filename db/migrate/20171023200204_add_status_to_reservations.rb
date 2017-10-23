class AddStatusToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :status, :string, null: false, default: 'pending'
  end
end

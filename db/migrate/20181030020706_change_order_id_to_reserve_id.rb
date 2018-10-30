class ChangeOrderIdToReserveId < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations_menuitems, :order_id, :reservation_id
  end
end

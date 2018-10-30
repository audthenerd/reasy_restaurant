class ChangeOrderIdToReserveId < ActiveRecord::Migration[5.2]
  def change
    rename_column :menuitems_reservations, :order_id, :reservation_id
  end
end

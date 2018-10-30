class ChangeReserveOrder < ActiveRecord::Migration[5.2]
  def change
    rename_table :orders_menuitems, :menuitems_reservations
  end
end

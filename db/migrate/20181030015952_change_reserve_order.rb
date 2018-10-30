class ChangeReserveOrder < ActiveRecord::Migration[5.2]
  def change
    rename_table :orders_menuitems, :reservations_menuitems
  end
end

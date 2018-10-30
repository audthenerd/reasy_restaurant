class AddQuantityToReserveMenuitems < ActiveRecord::Migration[5.2]
  def change

    add_column :menuitems_reservations, :quantity, :integer
  end
end

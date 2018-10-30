class AddQuantityToReserveMenuitems < ActiveRecord::Migration[5.2]
  def change

    add_column :reservations_menuitems, :quantity, :integer
  end
end

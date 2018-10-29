class OrdersMenuitems < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_menuitems, id: false do |t|
     t.references :order
     t.references :menuitem
    end
  end
end

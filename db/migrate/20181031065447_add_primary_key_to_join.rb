class AddPrimaryKeyToJoin < ActiveRecord::Migration[5.2]
  def change
    add_column :menuitems_reservations, :id, :primary_key
  end
end

class ChangeLatLongColOfCus < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :lat, :decimal
    change_column :customers, :long, :decimal
  end
end
 
class ChangeCorTypeToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :restaurants, :longitude, :float
    change_column :restaurants, :latitude, :float
    change_column :customers, :longitude, :float
    change_column :customers, :latitude, :float
  end
end

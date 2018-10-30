class ChangeeColToRestLatAndLong < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :latitude, :decimal
    remove_column :restaurants, :lat
    add_column :restaurants, :longitude, :decimal
    remove_column :restaurants, :long

    add_column :customers, :latitude, :decimal
    remove_column :customers, :lat
    add_column :customers, :longitude, :decimal
    remove_column :customers, :long
  end
  
end

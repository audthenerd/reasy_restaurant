class AddColToRestLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :street, :string
    add_column :restaurants, :zip, :string
    add_column :restaurants, :city, :string
    remove_column :restaurants, :location
  end
end

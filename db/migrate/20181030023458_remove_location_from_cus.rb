class RemoveLocationFromCus < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :location
  end
end

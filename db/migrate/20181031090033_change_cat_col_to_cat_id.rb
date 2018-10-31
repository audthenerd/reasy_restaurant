class ChangeCatColToCatId < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :category
    add_column :restaurants, :category_id, :integer
  end
end

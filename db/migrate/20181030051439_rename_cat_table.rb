class RenameCatTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :catergories, :categories
  end
end

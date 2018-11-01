class RemoveImageurl23FromRest < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :image2_url
    remove_column :restaurants, :image3_url
  end
end

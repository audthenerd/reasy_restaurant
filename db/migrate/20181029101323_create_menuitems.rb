class CreateMenuitems < ActiveRecord::Migration[5.2]
  def change
    create_table :menuitems do |t|
      t.text :item
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end

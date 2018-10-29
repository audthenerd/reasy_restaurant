class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :category
      t.text :location
      t.decimal :lat, {precision: 10, scale: 8}
      t.decimal :long, {precision: 10, scale: 8}

      t.timestamps
    end
  end
end

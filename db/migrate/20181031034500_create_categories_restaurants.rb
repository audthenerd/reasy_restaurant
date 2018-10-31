class CreateCategoriesRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_restaurants do |t|
      t.references :category
     t.references :restaurant
    end
  end
end

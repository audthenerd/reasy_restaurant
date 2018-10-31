class AddCusRestIndexToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :restaurant, index: true
    add_reference :reviews, :customer, index: true
  end
end

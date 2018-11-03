class AddSeatsToResearvation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seats, :integer
  end
end

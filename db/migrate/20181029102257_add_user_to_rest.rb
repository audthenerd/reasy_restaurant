class AddUserToRest < ActiveRecord::Migration[5.2]
  def change
    add_reference :restaurants, :userrest, foreign_key: true
  end
end

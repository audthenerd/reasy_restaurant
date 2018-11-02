class AddColToRest < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :avail_seats, :integer
    add_column :restaurants, :starttime, :time
    add_column :restaurants, :endtime, :time
    add_column :restaurants, :breakstart, :time
    add_column :restaurants, :breakend, :time
    add_column :restaurants, :telephone, :text
    add_column :restaurants, :opening_hours, :text
  end
end

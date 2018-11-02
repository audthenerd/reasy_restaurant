class ChangeDateTimeDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :reservation_date, :date
    change_column :reservations, :reservation_time, :time

  end
end

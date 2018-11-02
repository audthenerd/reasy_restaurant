class Menuitem < ApplicationRecord
  belongs_to :restaurant
  has_many :menuitems_reservations
  has_many :reservations, through: :menuitems_reservations
  # has_and_belongs_to_many :reservations
end

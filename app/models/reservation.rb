class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :restaurant

  has_many :menuitems_reservations
  has_many :menuitems, through: :menuitems_reservations

  accepts_nested_attributes_for :menuitems_reservations


end

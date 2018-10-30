class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :restaurant

  has_many :menuitems, through: :reservations_menuitems
  has_many :reservations_menuitems

  accepts_nested_attributes_for :reservations_menuitems


end

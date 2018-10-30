class ReservationMenuitem < ApplicationRecord
  belongs_to :menuitem
  belongs_to :reservation
end
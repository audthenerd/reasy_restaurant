class Restaurant < ApplicationRecord
  has_many :menuitems

   has_many :orders
   has_many :reservations
   has_many :customers, through: :reservations
   belongs_to :userrest
end

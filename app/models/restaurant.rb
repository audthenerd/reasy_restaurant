class Restaurant < ApplicationRecord
  belongs_to :userrest
  has_many :menuitems
  has_many :orders
  has_many :reservations
  has_many :customers, through: :reservations
  has_many :categories
end

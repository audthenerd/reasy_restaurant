class Order < ApplicationRecord
  belongs_to :restaurant
   belongs_to :customer
   has_and_belongs_to_many :menu_items
end

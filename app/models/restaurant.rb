class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :userrest
  has_many :menuitems
  has_many :orders
  has_many :reservations
  has_many :customers, through: :reservations
  has_many :categories

  def address
    [street, city, zip].compact.join(", ")
  end

  def address_changed?
    street_changed? || city_changed? || zip_changed?
  end

end

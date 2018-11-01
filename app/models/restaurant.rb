class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :userrest
  has_many :menuitems
  has_many :orders
  has_many :reservations
  has_many :customers, through: :reservations
  has_many :reviews
  has_and_belongs_to_many :categories

  serialize :image_url, Array

  def address
    [street, city, zip].compact.join(", ")
  end

  def address_changed?
    street_changed? || city_changed? || zip_changed?
  end

end

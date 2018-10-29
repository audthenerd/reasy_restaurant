class Customer < ApplicationRecord
  has_many :orders
  has_many :reservations
  has_many :restaurants, through: :reservations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

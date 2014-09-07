class Rental < ActiveRecord::Base
  validates :rental_type, presence: true
  validates :location, presence: true
  validates :city, presence: true, length: { maximum: 20 }
  validates :state, presence: true, length: { is: 2 }
  validates :zip, numericality: true, length: { minimum: 5 }
  validates :price, presence: true, numericality: true
  validates :beds, numericality: true, allow_nil: true
  validates :bath, numericality: true, allow_nil: true
  validates :password, length: { minimum: 6 }, on: :create

  has_secure_password
end

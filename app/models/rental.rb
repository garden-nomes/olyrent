class Rental < ActiveRecord::Base
  validates :rental_type, presence: true
  validates :location, presence: true
  validates :price, presence: true, numericality: true
  validates :beds, presence: true, numericality: true
  validates :bath, presence: true, numericality: true
  validates :password, length: { minimum: 6 }

  has_secure_password
end

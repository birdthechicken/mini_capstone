class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :orders
  has_many :carted_products

  def cart
    carted_products.where(status: "carted")
  end
end

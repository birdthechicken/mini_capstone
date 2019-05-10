class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :price, presence: true
  validates :price, numericality: { greater_than: 0, less_than: 10000000 }
  

  validates :description, presence: true
  # validates :description, length: { in: 5..200 }

  validates :image_url, length: { maximum: 255 }

  def is_discounted?
    price < 1000
    # if price < 1000
    #    true
    # else
    #    false
    # end
  end

  def tax
    price * 0.09 
  end

  def total
    price + tax
  end
end

class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :price, presence: true
  validates :price, numericality: { greater_than: 0, less_than: 10000000 }
  

  validates :description, presence: true
  # validates :description, length: { in: 5..200 }

  has_many :images
  # def images
  #     Image.where(product_id: self.id)
  # end

  belongs_to :supplier
  # def supplier
  #   # the purpose of this method is to return the Supplier Object associated with this product
  #   Supplier.find_by(id: self.supplier_id) 
  # end

  has_many :orders

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

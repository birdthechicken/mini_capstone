class Product < ApplicationRecord
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

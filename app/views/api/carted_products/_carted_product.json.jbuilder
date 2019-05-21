json.id carted_product.id

json.user do
  json.partial! carted_product.user, partial: 'api/users/user', as: :user
end

json.product do
  json.partial! carted_product.product, partial: 'api/products/product', as: :product
end

json.quantity carted_product.quantity
json.status carted_product.status

 
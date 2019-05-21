json.id order.id

json.user do 
  json.partial! order.user, partial: 'api/users/user', as: :user
end

json.carted_products do 
  json.array! order.carted_products, partial: 'api/carted_products/carted_product', as: :carted_product
end

json.subtotal order.subtotal
json.tax order.tax
json.total order.total
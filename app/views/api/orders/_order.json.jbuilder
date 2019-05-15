json.id order.id
json.user_id order.user_id
json.product do 
  json.partial! order.product, partial: 'api/products/product', as: :product
end
json.quantity order.quantity
json.subtotal order.subtotal
json.tax order.tax
json.total order.total
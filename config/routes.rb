Rails.application.routes.draw do
  namespace :api do
    get '/all_products_url' => 'products#all_products_action'
    get '/first_product_url' => 'products#first_product_action'
    get '/second_product_url' => 'products#second_product_action'
    get '/third_product_url' => 'products#third_product_action'
  end
end

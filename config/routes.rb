Rails.application.routes.draw do
  namespace :api do
    get '/all_products_url' => 'products#all_products_action'
    get '/one_product_url' => 'products#one_product_action'
    
  end
end

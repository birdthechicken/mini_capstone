class Api::CartedProductsController < ApplicationController

   def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render 'index.json.jbuilder'
  end


  def create
    @carted_products = CartedProduct.new(
                                          user_id: current_user.id,
                                          product_id: params[:product_id],
                                          quantity: params[:quantity],
                                          status: "carted"
                                        )

    if @carted_products.save
     render 'show.json.jbuilder'
     else
     end 
  end

 
end

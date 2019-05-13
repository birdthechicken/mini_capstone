class Api::SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all

    render 'show.json.jbuilder' 
  end

  def create
    @supplier = Supplier.new(
                             name: params[:name],
                             email: params[:email],
                             phone_number: params[:phone_number] 
                            )
    @product.save
    render 'show.json.jbuilder'
  end


end 
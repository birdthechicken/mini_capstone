class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
      @orders = current_user.orders 
      render 'index.json.jbuilder'
  end


  def create
    subtotal = 0
    cart = current_user.carted_products.where(status: "carted")
    
    cart.each do |item|
      subtotal += item.product.price * item.quantity
    end

    calculated_tax = subtotal * 0.09
    calculated_total = subtotal + calculated_tax

    @order = Order.new(
                        user_id: current_user.id,
                        subtotal: subtotal,
                        tax: calculated_tax,
                        total: calculated_total    
                      )

    if @order.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end
end

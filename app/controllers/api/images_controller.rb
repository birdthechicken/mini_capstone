class Api::ImagesController < ApplicationController
  before_action :authenticate_admin
  
  def index
    @images = Image.all
    render 'index.json.jbuilder'
  end

  def create
    @image = Image.new(
                      product_id: params[:product_id],
                      url: params[:image_url]
                      )
    if @image.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity
    end
  end

    def show
      @image = Image.find(params[:id])
      render 'show.json.jbuilder'
    end

    def update
      @image = image.find(params[:id])
      
      @image.url = params[:url] || @image.url
      @image.product_id = params[:product_id] || @image.product_id

      if @image.save
        render 'show.json.jbuilder'
      else
        render json: { message: @image.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @image = Image.find(params[:id])
      @image.destroy
      render json: {message: "Successfully Destroyed Image"}
    end
end
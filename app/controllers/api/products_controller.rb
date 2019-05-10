class Api::ProductsController < ApplicationController
  def index
    search_term = params[:search]
    discounted = params[:discount]
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    
    @products = Product.all

    if search_term
      @products = @products.where("name iLIKE ?", "%#{search_term}%")
    end

    if discounted == "true"
      @products = @products.where("price < ?", 1000) 
    end

    if sort_attribute == "price" && sort_order == "desc"
      @products = @products.order(price: :desc)
    elsif sort_attribute == "price"
      @products = @products.order(:price)
    else
      @products = @products.order(:id)
    end
    render 'index.json.jbuilder'
  end

  def create
    @product = Product.new(
                          name: params[:name],
                          price: params[:price],
                          image_url: params[:image_url],
                          description: params[:description],
                          supplier_id: params[:supplier_id]
                          )

    if @product.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @products.supplier_id

    if @product.save
      render 'show.json.jbuilder'
    else
      render json: { message: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    render json: {message: "You killed a product"}
  end
end

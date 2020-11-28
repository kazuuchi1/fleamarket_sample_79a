class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    @product_images = ProductImage.all
  end

  def new
  end

  def show
    @product = Product.find(params[:id])
    @categories = @product.categories
    @product_image = ProductImage.find_by(product_id: params[:id])
    @product_images = ProductImage.all.where(product_id: params[:id])
  end

end


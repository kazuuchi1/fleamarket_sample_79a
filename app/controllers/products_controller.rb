class ProductsController < ApplicationController

  def index
    @products = Product.all
    @product_image = ProductImage.where(params[:ids]).first
  end

  def show
    @product = Product.find(params[:id])
    @categories = @product.categories
    @user = User.find(params[:id])
    @product_image = ProductImage.where(params[:ids]).first
    @product_images = ProductImage.all.where(params[:ids])
  end

end

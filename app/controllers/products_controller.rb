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

  def destroy
    @product = Product.find(params[:id])
    if @product.user.id == current_user.id
      @product.destroy
      redirect_to root_path
    else
      render root_path
    end
  end

end
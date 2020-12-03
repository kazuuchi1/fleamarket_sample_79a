class ProductsController < ApplicationController
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  def new
    @product = Product.new
  end
  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def index
    @products = Product.all
    @product_images = ProductImage.all
    @parents = Category.where(ancestry: nil) 
  end

  def show
    @product = Product.find(params[:id])
    @categories = @product.categories
    @product_image = ProductImage.find_by(product_id: params[:id])
    @product_images = ProductImage.all.where(params[:ids])
  end

  private
  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

end
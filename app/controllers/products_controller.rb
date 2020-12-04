class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    @products = Product.includes(:images).order('created_at DESC')
    @product_images = ProductImage.all
    # render action: :new
  end

  def new
    @product = Product.new
    @product.product_images.build 
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
      flash.now[:alert] = "商品出品に失敗しました"
    end
  end

  def edit
  end

  def show
    @product = Product.find(params[:id])
    @categories = @product.categories
    @product_image = ProductImage.find_by(product_id: params[:id])
    @product_images = ProductImage.all.where(params[:ids])
  end

  before_action :set_product, except: [:index, :new, :create]

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
      flash.now[:alert] = '商品情報の更新に失敗しました'
    end
  end

  def destroy
    if @product.destroy
      redirect_to :root
    else
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category, :brand, :status, :shipping_method, :prefecture_id, :days, :price, images_attributes: [:src, :_destroy, :id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end


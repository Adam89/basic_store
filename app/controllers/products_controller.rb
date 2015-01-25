class ProductsController < ApplicationController
  before_action :authenticate_admin!, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)

    if @product.save
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    Product.find(params[:id]).destroy

    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :image,
      :price,
      :category_id,
    )
  end
end

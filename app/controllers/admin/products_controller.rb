class Admin::ProductsController < ApplicationController

  layout "admin"
  before_action :require_admin_session
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new params[:product].permit(:name, :price)

    if @product.save
      redirect_to admin_products_url
    else
      render :new
    end
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]

    if @product.update params[:product].permit(:name, :price)
      redirect_to admin_products_url
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to admin_products_url
  end
end

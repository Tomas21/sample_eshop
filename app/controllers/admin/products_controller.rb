class Admin::ProductsController < ApplicationController

  layout "admin"
  
  def index
    @products_count = Product.count
  end

  def new
  end

  def edit
  end
end

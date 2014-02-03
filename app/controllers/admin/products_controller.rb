class Admin::ProductsController < ApplicationController

  layout "admin"
  before_action :require_admin_session
  
  def index
    @products_count = Product.count
  end

  def new
  end

  def edit
  end
end

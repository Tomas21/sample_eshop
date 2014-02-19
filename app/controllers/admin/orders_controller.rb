class Admin::OrdersController < ApplicationController
  layout "admin"
  before_action :require_admin_session

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find params[:id]
  end

  def destroy
    @order = Order.find params[:id]
    @order.destroy

    flash[:notice] = "Objednavka bola uspesne zmazana."
    redirect_to orders_url
  end
end

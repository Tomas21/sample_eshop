class OrdersController < ApplicationController
  before_action :require_user_session

  def create
    @order = Order.new
    @order.user = current_user

    session[:items].each do |item|
      @order.order_items.build(
        product_id: item[:product_id],
        quantity:   item[:quantity],
        price:      Product.find(item[:product_id]).price
      )
    end

    if @order.save
      flash[:notice] = "Ďakujeme za objednávku."
      session[:items] = nil
    end
    redirect_to cart_items_url
  end
end

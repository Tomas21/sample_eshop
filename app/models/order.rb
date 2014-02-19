class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items

  def total_price
    sum = 0

    order_items.each do |order_item|
      sum = sum + (order_item.price * order_item.quantity)
    end

    sum
  end
end

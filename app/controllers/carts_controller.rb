class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end
  
  def checkout
    @items = current_order.order_items
    @order = current_order
    @order.build_address
  end

  def success
    render :success
  end
end

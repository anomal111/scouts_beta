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
  
  def modify_volume
    order_items.each do |item|
      @issue = Issue.find(item.issue_id)
      current = @issue.volume
      current = current - item.quantity
      @issue.update_attributes(:volume => current)
    end
  end
end



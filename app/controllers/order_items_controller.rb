class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    if @order.save
      @issue = Issue.find(@order_item.issue_id)
      current = @issue.volume
      if current < @order_item.quantity
        session[:return_to] ||= request.referer
        respond_to do |format|
        if @order_item.destroy
          format.html { redirect_to session.delete(:return_to), notice: 'No chyba nie!' }
          format.json { head :no_content }
        end
      end
      else
        current = current - @order_item.quantity
        @issue.update_attributes(:volume => current)
      
        respond_to do |format|
          format.html { redirect_to @issue }
          format.js
        end
      end
    end
    
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    current_quantity = @order_item.quantity
    updated_quantity = order_item_params[:quantity].to_i
    
    @issue = Issue.find(@order_item.issue_id)
    current = @issue.volume
    
    if current_quantity > updated_quantity
      diff = current_quantity - updated_quantity
      #if diff < current
        current = current + diff
        #else
        #break
        #end
    else
      diff = updated_quantity - current_quantity
      #if diff < current
        current = current - diff
        #else
        #break
        #end
    end
    
    @issue.update_attributes(:volume => current)
    
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
  
  private
    def set_item
      @item = Item.find(params[:id])
    end
  
    def order_item_params
      params.require(:order_item).permit(:quantity, :issue_id, :commission, :sent, :unit_price, :order_id)
    end
end

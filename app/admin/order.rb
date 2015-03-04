ActiveAdmin.register Order do

  menu :label => "Zamówienia", :url => "/12_gustkiewicz/krajka/admin/orders"
  
  permit_params :subtotal, :shipping, :total, :payment, :status, :sent,
    order_item_attributes: [:sent, :order_id],
    address_attributes: [:name, :surname, :street, :building_number, :apartment_number, :city, :zip_code]
  includes :address
  includes :order_items
  
  #permit_params :status, :payment, :sent
  actions :all, :change_status, :annual_sales, :change_payment, :order_archives, :change_sent, :except => [:edit, :create, :new]
  
  index do
    selectable_column
    id_column
    column :created_at
    column :subtotal
    column :total
    column :status #order.status == 'w realizacji'
    column 'Edycja statusu' do |order|
      link_to 'Zmień status', change_status_admin_order_path(order)
    end
    column :payment
    column 'Edycja daty płatności' do |order|
      #if order.status == 'zapłacone'
      if !order.payment.nil?
        link_to 'Zmień date płatności', change_payment_admin_order_path(order)
      else
        'Akcja niedostępna'
      end
    end
    actions
  end
  
  show do
    attributes_table do
      row :id
      row :status
      row :created_at
      row :subtotal
      row :payment
      row :shipping
      row :total
      @address = Address.where(shipping_id: params[:id]).first
      table_for @address do
        column :name
        column :surname
        column :street
        column :house_number
        column :apartment_number
        column :zip_code
        column :city
      end

      table_for order.order_items do
        column do |item|
          image_tag item.issue.picture.url(:thumb)
        end
        column "Tytuł" do |item|
          item.issue.title
        end
        column "Ilość" do |item|
          item.quantity
        end
        column "Komis" do |item|
          item.commission
        end
        
        column "Wysłane" do |item|
          item.sent
        end
        column "Zmien pole wysłane" do |item|
          #link_to("Zmień",
            #change_sent_admin_order_path(item, item: { updated_at: Time.now, sent: true }),
            #remote: true, method: :patch
          #)
          
          link_to 'Zrób to!', change_sent_admin_order_path(item)
        end
      end
    end
  end #end of show
  
  action_item only: [:index] do
    button_to "Statystyki", annual_sales_admin_orders_path
  end
  action_item only: [:index] do
    button_to "Archiwum", order_archives_admin_orders_path
  end
  
  member_action :change_status, method: [:get, :post] do
    @order = Order.where(id: params[:id]).first
  end
  member_action :change_payment, method: :get do
    @order = Order.where(id: params[:id]).first
  end
  member_action :change_sent, method: [:get, :post] do
    #@item = OrderItem.find(params[:id])
    #order_id = Order.where(id: params[:id]).first
  end
  
  collection_action :order_archives, :method => :post do
    @orders = Order.all.select { |order| order.status == 'zrealizowane' }
  end

  collection_action :annual_sales, :method => :post do
    @order_sum = Order.all.count(:group => "year(created_at)")
  end
  
  controller do
    def change_sent
      @item = OrderItem.find(params[:id])
      if @item.sent == 'false'
        @sent = 'true'
      else
        @sent = 'false'
      end
      session[:return_to] ||= request.referer
      respond_to do |format|
        if @item.update_attributes(:sent => @sent)
          format.html { redirect_to session.delete(:return_to), notice: 'Zmieniono status wysyłki' }
          format.json { head :no_content }
        end
      end
    end
    
  end
  
  
end
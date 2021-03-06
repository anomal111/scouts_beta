class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    if current_user
      @orders = Order.where("user_id = ?", current_user.id)
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.build_address
  end

  # GET /orders/1/edit
  def edit
    @order.build_address

  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    if params[:id]
      @order = Order.find(params[:id])
    else
      @order = current_order
    end

    respond_to do |format|
      if @order.update(order_params)
        session[:order_id]=nil
        format.html { redirect_to root_path, notice: 'Dziękujemy za złożenie zamówienia!' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    session[:order_id]=nil
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:status, :total, :payment, :subtotal, :tax, :shipping, :user_id, :created_at, address_attributes: [:id, :order_id, :name, :surname, :street, :house_number, :apartment_number, :city, :zip_code])
  end


end

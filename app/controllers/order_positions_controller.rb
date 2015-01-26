class OrderPositionsController < ApplicationController
  before_action :set_order_position, only: [:show, :edit, :update, :destroy]

  # GET /order_positions
  # GET /order_positions.json
  def index
    @order_positions = OrderPosition.all
  end

  # GET /order_positions/1
  # GET /order_positions/1.json
  def show
  end

  # GET /order_positions/new
  def new
    @order_position = OrderPosition.new
  end

  # GET /order_positions/1/edit
  def edit
  end

  # POST /order_positions
  # POST /order_positions.json
  def create
    @order_position = OrderPosition.new(order_position_params)

    respond_to do |format|
      if @order_position.save
        format.html { redirect_to @order_position, notice: 'Order position was successfully created.' }
        format.json { render :show, status: :created, location: @order_position }
      else
        format.html { render :new }
        format.json { render json: @order_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_positions/1
  # PATCH/PUT /order_positions/1.json
  def update
    respond_to do |format|
      if @order_position.update(order_position_params)
        format.html { redirect_to @order_position, notice: 'Order position was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_position }
      else
        format.html { render :edit }
        format.json { render json: @order_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_positions/1
  # DELETE /order_positions/1.json
  def destroy
    @order_position.destroy
    respond_to do |format|
      format.html { redirect_to order_positions_url, notice: 'Order position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_position
      @order_position = OrderPosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_position_params
      params.require(:order_position).permit(:ordinal, :amount, :completed, :price)
    end
end

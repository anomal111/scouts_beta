require 'test_helper'

class OrderPositionsControllerTest < ActionController::TestCase
  setup do
    @order_position = order_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_position" do
    assert_difference('OrderPosition.count') do
      post :create, order_position: { amount: @order_position.amount, completed: @order_position.completed, ordinal: @order_position.ordinal, price: @order_position.price }
    end

    assert_redirected_to order_position_path(assigns(:order_position))
  end

  test "should show order_position" do
    get :show, id: @order_position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_position
    assert_response :success
  end

  test "should update order_position" do
    patch :update, id: @order_position, order_position: { amount: @order_position.amount, completed: @order_position.completed, ordinal: @order_position.ordinal, price: @order_position.price }
    assert_redirected_to order_position_path(assigns(:order_position))
  end

  test "should destroy order_position" do
    assert_difference('OrderPosition.count', -1) do
      delete :destroy, id: @order_position
    end

    assert_redirected_to order_positions_path
  end
end

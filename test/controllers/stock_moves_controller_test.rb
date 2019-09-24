require 'test_helper'

class StockMovesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_move = stock_moves(:one)
  end

  test "should get index" do
    get stock_moves_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_move_url
    assert_response :success
  end

  test "should create stock_move" do
    assert_difference('StockMove.count') do
      post stock_moves_url, params: { stock_move: { date: @stock_move.date, move_description: @stock_move.move_description, product_cost: @stock_move.product_cost, product_id: @stock_move.product_id, product_name: @stock_move.product_name, quantity: @stock_move.quantity, uom_name: @stock_move.uom_name } }
    end

    assert_redirected_to stock_move_url(StockMove.last)
  end

  test "should show stock_move" do
    get stock_move_url(@stock_move)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_move_url(@stock_move)
    assert_response :success
  end

  test "should update stock_move" do
    patch stock_move_url(@stock_move), params: { stock_move: { date: @stock_move.date, move_description: @stock_move.move_description, product_cost: @stock_move.product_cost, product_id: @stock_move.product_id, product_name: @stock_move.product_name, quantity: @stock_move.quantity, uom_name: @stock_move.uom_name } }
    assert_redirected_to stock_move_url(@stock_move)
  end

  test "should destroy stock_move" do
    assert_difference('StockMove.count', -1) do
      delete stock_move_url(@stock_move)
    end

    assert_redirected_to stock_moves_url
  end
end

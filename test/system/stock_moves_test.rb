require "application_system_test_case"

class StockMovesTest < ApplicationSystemTestCase
  setup do
    @stock_move = stock_moves(:one)
  end

  test "visiting the index" do
    visit stock_moves_url
    assert_selector "h1", text: "Stock Moves"
  end

  test "creating a Stock move" do
    visit stock_moves_url
    click_on "New Stock Move"

    fill_in "Date", with: @stock_move.date
    fill_in "Move description", with: @stock_move.move_description
    fill_in "Product cost", with: @stock_move.product_cost
    fill_in "Product", with: @stock_move.product_id
    fill_in "Product name", with: @stock_move.product_name
    fill_in "Quantity", with: @stock_move.quantity
    fill_in "Uom name", with: @stock_move.uom_name
    click_on "Create Stock move"

    assert_text "Stock move was successfully created"
    click_on "Back"
  end

  test "updating a Stock move" do
    visit stock_moves_url
    click_on "Edit", match: :first

    fill_in "Date", with: @stock_move.date
    fill_in "Move description", with: @stock_move.move_description
    fill_in "Product cost", with: @stock_move.product_cost
    fill_in "Product", with: @stock_move.product_id
    fill_in "Product name", with: @stock_move.product_name
    fill_in "Quantity", with: @stock_move.quantity
    fill_in "Uom name", with: @stock_move.uom_name
    click_on "Update Stock move"

    assert_text "Stock move was successfully updated"
    click_on "Back"
  end

  test "destroying a Stock move" do
    visit stock_moves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stock move was successfully destroyed"
  end
end

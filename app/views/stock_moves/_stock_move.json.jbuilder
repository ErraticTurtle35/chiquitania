json.extract! stock_move, :id, :product_name, :product_id, :date, :move_description, :uom_name, :quantity, :product_cost, :created_at, :updated_at
json.url stock_move_url(stock_move, format: :json)

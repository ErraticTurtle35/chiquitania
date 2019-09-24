class StockMove
    include Mongoid::Document
    include Mongoid::Timestamps
    field :product_name, type: String
    field :product_id, type: Integer
    field :date, type: Time
    field :move_description, type: String
    field :uom_name, type: String
    field :quantity, type: Float
    field :product_cost, type: Float
  end
  
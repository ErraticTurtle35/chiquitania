require "bunny"
require 'json'

conn = Bunny.new(
    addresses: 'lion.rmq.cloudamqp.com',
    username:  'pconpuub',
    password:  'Y8IjBDtuqg2BfSnGIkRXAb0bYjEgMbax',
    vhost:     'pconpuub'
  )
conn.start

ch   = conn.create_channel
move = {
    :product_name => 'Pan',
    :date => '2019-09-24 08:44:58',
    :move_description => 'Ingreso',
    :uom_name => 'Unidades',
    :quantity => 1.0,
    :product_cost => 50.0
}
ch.default_exchange.publish(move.to_json, :routing_key => "stock_move.post", :content_type =>"application/json", :payload_encoding => "string")
puts " [x] Sent 'Stock Move!'"

conn.close
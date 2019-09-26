class StockMoveWorker
    include Sneakers::Worker
    from_queue "stock_move.post"

    def work(message)
        Sneakers.logger.info "message from the queue demo.post \n #{message}"
        stock_move =  JSON.parse(message, :quirks_mode => true)
        StockMove.create!(stock_move)
        Sneakers.logger.info "message saved from the queue demo.post \n #{stock_move.to_json}"
        ack!
    end
end

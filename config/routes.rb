Rails.application.routes.draw do
  resources :stock_moves
  get '/stock_moves/kardex/:product_id', to: 'stock_moves#kardex'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root 'barbecues#index'
  get '/api/barbecues/:id' => 'barbecues#api_show'
  post '/api/barbecues/:id/join' => 'barbecues#add_participant'
  get '/api/barbecues/:id/itemlist' => 'itemlists#show'
  post '/api/barbecues/:id/itemlist/:item' => 'itemlists#add_item'
  resources :barbecues, only: [ :index, :show, :new, :create ]
end

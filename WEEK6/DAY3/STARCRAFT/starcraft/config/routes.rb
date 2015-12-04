Rails.application.routes.draw do
  get '/matches' => 'matches#index'
  get '/matches/:faction_id' => 'matches#faction'
  get '/player/:player_id'   => 'players#show'
end

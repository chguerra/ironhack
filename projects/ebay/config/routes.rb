Rails.application.routes.draw do

root to: 'users#index'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'

      resources :users, only: [:show, :new, :create, :destroy, :update, :index] do
        resources :products, only: [:new, :index, :show, :create, :destroy]
      end


end

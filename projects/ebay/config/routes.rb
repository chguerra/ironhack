Rails.application.routes.draw do

      resources :users, only: [:show, :new, :create, :destroy, :update] do
        resources :products, only: [:new, :index, :show, :create, :destroy]
      end


end

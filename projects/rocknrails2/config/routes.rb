Rails.application.routes.draw do
  resources :concerts, only: [:index, :show, :new, :create, :destroy, :update]
end

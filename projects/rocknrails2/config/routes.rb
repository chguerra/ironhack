Rails.application.routes.draw do

  post '/search' => 'concerts#search'

  post '/mostcommented' => 'concerts#mostcommented'

  resources :concerts, only: [:index, :show, :new, :create, :destroy, :update, :search] do
      resources :comments, only: [:index, :show, :new, :create, :destroy, :update]
  end
end

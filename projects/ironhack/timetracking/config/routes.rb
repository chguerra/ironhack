Rails.application.routes.draw do

  get '/' => 'site#home'

 resources :projects, only: [:index, :show, :new, :create] do
 	resources :entries, only: [:index, :new, :create]
 end
  
end

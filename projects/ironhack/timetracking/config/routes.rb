Rails.application.routes.draw do

  get '/' => 'site#home'

 resources :projects, only: [:index, :show, :new, :create, :edit] do
 	resources :entries, only: [:index, :new, :create, :edit, :update, :destroy]
 end
  	resources :people, only: [:new, :create, :index, :show, :update] 

end

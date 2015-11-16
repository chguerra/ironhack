Rails.application.routes.draw do

  get '/' => 'site#home'

  get '/projects' => 'projects#index'
 
end

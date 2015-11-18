Rails.application.routes.draw do

  get '/' => 'site#home'

  get '/projects' => 'projects#index'

  get '/projects/:id' => 'projects#show'

  get '/projects/:project_id/entries' => 'entries#index'
end

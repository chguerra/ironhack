Rails.application.routes.draw do
  get '/:url' => 'redirect#redirect'
end

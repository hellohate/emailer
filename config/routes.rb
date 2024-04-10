Rails.application.routes.draw do
  get '/forms', to: 'forms#index'
  post '/forms/create', to: 'forms#create'
end

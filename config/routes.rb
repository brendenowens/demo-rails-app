Rails.application.routes.draw do
  post '/batman_villains', to: 'batman_villains#create'
  get '/batman_villains', to: 'batman_villains#index'
  get '/secrets', to: 'secret#index'
  get '/secrets/:secret_name', to: 'secret#show'
  root to: 'hello#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :trips

  post '/login', to: 'users#login'
  get '/current_user', to: 'users#get_current_user'

  get "/:user_id/trips", to: 'trips#user_trips'
  post "/:user_id/trips", to: 'trips#create'

end

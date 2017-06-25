Rails.application.routes.draw do
  get '/signup' => 'users#new'
  resources :users
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :polls

  get '/appts/:poll_id' => 'appts#new'
  post '/appts' => 'appts#create'

  post '/responses' => 'responses#create'
  get '/responses' => 'responses#edit'
  patch '/responses' => 'responses#update'

  post '/userpolls' => 'userpolls#create'
end

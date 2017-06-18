Rails.application.routes.draw do
  get '/signup' => 'users#new'
  resources :users
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :polls
  #get '/polls' => 'polls#index'
  #get '/polls' => 'polls#new'
  #post '/polls' => 'polls#create'
  #get '/polls' => 'polls#show'
  #get '/polls' => 'polls#edit'
  #patch '/polls' => 'polls#update'
  ##delete '/polls' => 'polls#destroy'

  get '/appts' => 'appts#new'
  post '/appts' => 'appts#create'

  post '/responses' => 'responses#create'
  get '/responses' => 'responses#edit'
  patch '/responses' => 'responses#update'

  post '/userpolls' => 'userpolls#create'
end

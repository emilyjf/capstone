Rails.application.routes.draw do
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/polls' => 'polls#index'
  get '/polls' => 'polls#new'
  post '/polls' => 'polls#create'
  get '/polls' => 'polls#show'
  get '/polls' => 'polls#edit'
  patch '/polls' => 'polls#update'
  delete '/polls' => 'polls#destroy'

  post '/responses' => 'responses#create'
  get '/responses' => 'responses#edit'
  patch '/responses' => 'responses#update'

  post '/userpolls' => 'userpolls#create'

  

end

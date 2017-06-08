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
end

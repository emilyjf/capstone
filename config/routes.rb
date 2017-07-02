Rails.application.routes.draw do
  get '/signup' => 'users#new'

  resources :users
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :polls do
    member do
      get 'finalize'
      # get 'survey'
    end
  end

  get '/polls/:poll_id/users' => 'polls#edit'

  get '/appts/:poll_id' => 'appts#new'
  post '/appts' => 'appts#create'

  post '/responses' => 'responses#create'
  get '/responses' => 'responses#edit'
  patch '/responses' => 'responses#update'

  post '/userpolls' => 'userpolls#create'

  get '/pages' => 'pages#show' 
  get '/pages' => 'pages#index'
end

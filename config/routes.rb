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

  get '/polls/:id/invite' => 'polls#invite'
  post '/polls/:id/invite' => 'polls#invite_create'

  get '/polls/:poll_id/users' => 'polls#edit'
  post '/polls/:poll_id' => 'polls#create'
  patch '/polls/:poll_id/users' => 'polls#update'

  resources :appts
  get '/appts/:poll_id' => 'appts#new'
  post '/appts' => 'appts#create'
  patch '/appts/:poll_id' => 'appts#create'

  resources :responses
  # get '/responses' => 'responses#index'
  # get '/responses/new' => 'responses#new'
  # post '/responses' => 'responses#create'
  # get '/responses/:id' => 'responses#show'
  # get '/responses/:id/edit' => 'responses#edit'
  # patch '/responses/:id' => 'responses#update'
  # delete '/responses/:id' => 'responses#destroy'

  post '/userpolls' => 'userpolls#create'

  get '/pages' => 'pages#index'
  get '/pages/:id' => 'pages#show' 

  get '/mailers/:id' => 'mailers#show'
end

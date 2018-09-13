Rails.application.routes.draw do

  root :to => 'users#new'

  resources :users, :except => ['users#new', 'users#create']

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'


  resources :admin

end

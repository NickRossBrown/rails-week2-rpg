Rails.application.routes.draw do

  root :to => 'users#new'

  resources :users

  get '/signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'

end

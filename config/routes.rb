Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  get 'pages/home'
  get '/users/account', to: 'users#account'
  get '/users/profile', to: 'users#profile'

  post '/users/edit', to: 'users#update'
  post '/users/profile', to: 'users#update_profile'

  resources :rooms, only: [:index, :new, :create, :show]

  get 'result' => 'rooms#result'
  get 'search' => 'rooms#search'

  resources :reservations, only: [:index, :new, :create, :show]

end
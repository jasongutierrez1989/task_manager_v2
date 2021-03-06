Rails.application.routes.draw do

  get '/auth/facebook/callback' => 'sessions#facebook'
  get 'auth/failure', to: redirect('/')

  root 'sessions#welcome'

  get '/home' => 'sessions#home'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#login'

  get '/logout' => 'sessions#logout'

  get '/users/admin' => 'users#admin'

  resources :users

  resources :locations do
    resources :tasks, only: [:new, :show]
  end

  resources :tasks

end

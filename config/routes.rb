Rails.application.routes.draw do

  root 'sessions#welcome'

  get '/home' => 'sessions#home'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#login'

  get '/logout' => 'sessions#logout'

  resources :users

  #resources :tasks

  resources :tasks do
    resources :locations
  end

  resources :locations do
    delete :destroy
  end

end

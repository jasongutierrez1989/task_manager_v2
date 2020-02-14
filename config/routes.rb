Rails.application.routes.draw do

  root 'sessions#welcome'

  get '/home' => 'sessions#home'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#login'

  get '/logout' => 'sessions#logout'

  resources :users

  resources :tasks

  resources :locations do
    resources :tasks
  end

  resources :locations do
    delete :destroy
  end

end

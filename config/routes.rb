Rails.application.routes.draw do

  root 'sessions#welcome'

  get '/login' => 'sessions#new'
  
  get '/login' =>'sessions#login'



  resources :users

  resources :tasks

  resources :locations do
    resources :tasks
  end

  resources :locations do
    delete :destroy
  end

end

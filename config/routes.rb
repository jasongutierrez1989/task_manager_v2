Rails.application.routes.draw do

  resources :users
  resources :locations do
    resources :tasks
  end


end

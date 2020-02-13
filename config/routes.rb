Rails.application.routes.draw do

  resources :users

  resources :tasks

  resources :locations do
    resources :tasks
  end

  resources :locations do
    delete :destroy
  end

end

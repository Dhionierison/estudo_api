Rails.application.routes.draw do
 
  devise_for :users


  resources :products

  post 'users/login', to: 'users#login'
  post 'users/create', to: 'users#create'
  root 'products#index'
end

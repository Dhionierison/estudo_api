Rails.application.routes.draw do
  devise_for :users
  post 'users/login', to: 'users#login' 
  post 'users/create', to: 'users#create'
  resources :produtos, only: [:index, :create]
  resources :vendas, only: [:create]
end

Rails.application.routes.draw do
 
  devise_for :users


  resources :products
  resources :vendas, only: [:create]

  post 'users/login', to: 'users#login'
  post 'users/create', to: 'users#create'
  post 'vendas/create', to: 'vendas#create'
  root 'products#index'
end

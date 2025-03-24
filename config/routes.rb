Rails.application.routes.draw do
  # Rotas do Devise (autenticação de usuários)
  devise_for :users

  # Rotas RESTful para products
  resources :products

  # Outras rotas, como as rotas customizadas que você já tinha
  post 'users/login', to: 'users#login'
  post 'users/create', to: 'users#create'
  post 'users/buscar_usuarios', to: 'users#buscar_usuarios'

  post 'produtos/buscar_produtos', to: 'produtos#buscar_produtos'
  post 'vendas/buscar_vendas', to: 'vendas#buscar_vendas'

  post 'vendas', to: 'vendas#create'
end

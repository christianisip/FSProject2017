Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :products
  root to: 'main#index'

  get 'main/display'
  # get 'clean' => 'main#index', as: 'clean'
  get 'index' => 'main#index', as: 'index'
  get 'login' => 'main#login', as: 'login'
  get 'cart' => 'main#cart', as: 'cart'
  get 'newproduct' => 'main#newproduct', as: 'newproduct'
  get 'main/:number' => 'main#display', constraints: { number: /\d+/ }, as: 'displayproducts'

  resources :main do
    member do
      post :remember_to_cart # POST /customers/:id/remember_to_call/
    end
  end

  # resources :products
end

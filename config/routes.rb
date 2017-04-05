Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products


  get 'main/display'
  # get 'clean' => 'main#index', as: 'clean'
  get 'index' => 'main#index', as: 'index'
  get 'login' => 'main#login', as: 'login'
  get 'newproduct' => 'main#newproduct', as: 'newproduct'
  get 'main/:number' => 'main#display', constraints: { number: /\d+/ }, as: 'displayproducts'


  root 'main#index'
  # resources :products
end

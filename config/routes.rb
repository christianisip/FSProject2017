Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products
  get 'index' => 'main#index', as: 'index'
  get 'newproduct' => 'main#newproduct', as: 'newproduct'
  root 'main#index'
  resources :products
end

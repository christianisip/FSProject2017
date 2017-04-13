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
  get 'productinvoice' => 'main#productinvoice', as: 'productinvoice'
  get 'recentlyproduct' => 'main#recentlyproduct', as: 'recentlyproduct'
  get 'categoryproduct' => 'main#categoryproduct', as: 'categoryproduct'
  get 'main/:number' => 'main#display', constraints: { number: /\d+/ }, as: 'displayproducts'
  get 'about' => 'main#about', as: 'about'
  get 'contact' => 'main#contact', as: 'contact'

  resources :main do
    member do
      post :remember_to_cart # POST /customers/:id/remember_to_call/
      post :delete_to_cart # POST /customers/:id/delete_to_cart/
    end
  end

  # resources :products
end

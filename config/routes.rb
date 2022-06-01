Rails.application.routes.draw do
  resources :rates
  resources :payments
  devise_for :users
  resources :users
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :admins do
  end

  resources :orders do
    get 'admin_orders', on: :collection
    get 'full_order', on: :member
  end

  resources :buyers do
    get :add_cart, on: :member
  end

  resources :profiles do
   
  end

  resources :pages do
    get 'home', on: :collection
    get 'check_out', on: :collection
    get :remove_cart_product, on: :member
    get :add_one, on: :member
    get :reduce_one, on: :member
    get 'orderConfirm', on: :collection
  end

  resources :categories

  root to: "pages#home"
end

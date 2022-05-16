Rails.application.routes.draw do
  devise_for :users
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :admins do
   
  end

  resources :buyers do
   
  end

  resources :pages do
    
  end

  root to: 'pages#home'
end

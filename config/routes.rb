Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "products#index"

  get "/products", to: "products#index"
  get "/myproducts", to: "products#myindex"

  resources :products do
    resources :reviews
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end

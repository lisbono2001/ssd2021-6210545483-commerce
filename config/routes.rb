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

  get "/myaccount", to: "users#myindex"

  resources :categories

  namespace :products do
    post 'csv_upload'
  end

  resources :products do
    member do
      delete :delete_image_attachment
    end
  end
end
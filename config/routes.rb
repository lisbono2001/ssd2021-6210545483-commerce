Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "products#index"
  resources :products do
    resources :reviews
    member do
      delete :delete_image_attachment
    end
  end
  namespace :products do
    post 'csv_upload'
  end

  resources :categories
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get "/myproducts", to: "products#myindex"
  get "/myaccount", to: "users#myindex"

  get "/admins/products", to: "products#admins"
  get "/admins/users", to: "users#index"
end
Rails.application.routes.draw do
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
  resources :sessions

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get "/myproducts", to: "products#myindex"
  get "/myaccount", to: "users#myindex"

  resources :users
  get "/admins/products", to: "admin#products"
  get "/admins/users", to: "admin#users"
end
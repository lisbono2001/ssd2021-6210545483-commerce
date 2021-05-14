Rails.application.routes.draw do
  resources :line_items
  resources :carts
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
  resources :sessions, only: [:create]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get "myproducts", to: "products#myindex"
  get "myaccount", to: "users#myindex"

  scope "/admins" do
    resources :users
  end
  get "admins/users", to: "users#index"
  get "admins/allproducts", to: "products#allproducts"

end
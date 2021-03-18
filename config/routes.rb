Rails.application.routes.draw do
  root 'products#index'

  get "/products", to: "products#index"
  get "/product/:id", to: "products#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

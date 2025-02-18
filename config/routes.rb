Rails.application.routes.draw do
  root "products#index"

  # Auth resources
  resource :session
  resources :passwords, param: :token

  # All routes (CRUD)
  resources :products do
    resources :subscribers, only: [ :create ]
    resources :reviews, only: [ :create ]
  end

  resource :unsubscribe, only: [ :show ]

  # Health Check
  get "up" => "rails/health#show", as: :rails_health_check

  # Detailed Product resources (CRUD)
  # ----------------------------
  # get "/products", to: "products#index"

  # get "/products/new", to: "products#new"
  # post "/products", to: "products#create"

  # get "/products/:id", to: "products#show"

  # get "/products/:id/edit", to: "products#edit"
  # patch "/products/:id", to: "products#update"
  # put "/products/:id", to: "products#update"

  # delete "products/:id", to: "products#destroy"
end

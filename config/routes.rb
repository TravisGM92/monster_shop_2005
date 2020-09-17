Rails.application.routes.draw do

  get "/", to: "welcome#index"
  resources :merchants, only: [:index, :new, :show]
  post "/merchants", to: "merchants#create"
  get "/merchants/:id/edit", to: "merchants#edit"
  patch "/merchants/:id", to: "merchants#update"
  delete "/merchants/:id", to: "merchants#destroy"

  resources :items, only: [:index, :show]

  get "/items/:id/edit", to: "items#edit"
  patch "/items/:id", to: "items#update"
  get "/merchants/:merchant_id/items", to: "items#index"
  get "/merchants/:merchant_id/items/new", to: "items#new"
  post "/merchants/:merchant_id/items", to: "items#create"
  delete "/items/:id", to: "items#destroy"

  get "/items/:item_id/reviews/new", to: "reviews#new"
  post "/items/:item_id/reviews", to: "reviews#create"

  get "/reviews/:id/edit", to: "reviews#edit"
  patch "/reviews/:id", to: "reviews#update"
  delete "/reviews/:id", to: "reviews#destroy"

  post "/cart/:item_id", to: "cart#add_item"
  get "/cart", to: "cart#show"
  delete "/cart", to: "cart#empty"
  delete "/cart/:item_id", to: "cart#remove_item"
  post "/cart/:item_id/add", to: "cart#add_one"
  post "/cart/:item_id/remove", to: "cart#remove_one"

  get "/orders/new", to: "orders#new"
  post "/orders", to: "orders#create"
  get "/orders/:id", to: "orders#show"
  get '/profile/orders', to: "orders#show_orders"

  #Login/register
  get "/register", to: "users#new"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post "/register", to: "users#create"

  #profile routes

  post "/profile", to: "users#create"
  get "/profile", to: "users#show"
  get "profile/edit", to: 'users#edit', as: :edit_profile
  post "/profile/update", to: 'users#update'
  get '/profile/edit_password', to: 'users#password_update'
  post '/profile/edit_password', to: 'users#new_password'
  get '/profile/orders/:id/', to: 'orders#show'
  patch 'profile/orders/:id/cancel', to: 'orders#cancel'

  namespace :merchant do
    get "/", to: "dashboard#index"
    patch "/orders/:id", to: "item_orders#cancel"
  end

  post '/merchant/fulfill/:id', to: "merchants#fulfill"

  namespace :admin do
    get "/", to: "dashboard#index"
    get "/users", to: "users#index"
    post "/", to: "dashboard#ship_it"
  end

end

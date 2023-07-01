Rails.application.routes.draw do
  resources :sessions
  resources :users
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  get "/me", to: "sessions#show"
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
end

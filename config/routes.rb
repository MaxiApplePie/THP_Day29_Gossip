Rails.application.routes.draw do
  get "comments/index"
  get "/login", to: "static#login"
  get "/", to: "static#index"
  get "/index", to: "static#index"
  get "/welcome/:user", to: "static#welcome"
  get "/team", to: "static#team"
  get "/contact", to: "static#contact"
  get "/gossip/:id", to: "static#gossip"
  get "/author", to: "static#author"
  get "/profile", to: "static#profile"

  resources :gossips do
    resources :comments
  end
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]

  #will create roots with all the files gossips

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

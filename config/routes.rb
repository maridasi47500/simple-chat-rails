Rails.application.routes.draw do
  resources :posts
  resources :pseudos
  devise_for :users
  root to: "pseudos#index"
match "/websocket", :to => ActionCable.server, via: [:get, :post]
mount ActionCable.server => '/websocket'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

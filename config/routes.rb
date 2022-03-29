Rails.application.routes.draw do
  resources :user1s
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "user1s#index"

  get "user1s/new"
end

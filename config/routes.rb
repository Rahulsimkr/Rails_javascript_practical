Rails.application.routes.draw do
  resources :users do
    member do
      get :change_password
      patch :password_update
    end
  end
  match "users/:id/profile" => "users#edit", :via => :get, :as => :profile

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end

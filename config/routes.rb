Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'issues/index'
      get 'issues/issue'
      get 'issues/return'
      post "/login", to: "users#login"
      resources :users
      resources :books
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

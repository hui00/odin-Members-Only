Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: %i[new index create]
  get "static_pages/landing_page"
  get "static_pages/dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "static_pages#landing_page"
  # Defines the root path route ("/")
  # root "articles#index"
end

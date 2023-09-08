Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "pages#home"

  get "/movies", to: "movies#index"
  resources :movies, only: [:show] do
    resources :favorites, only: [:new, :create]
  end

  get "/movies/:id", to: "movies#random", as: :random_movie

  get "/lists", to: "lists#index"
  get "/lists/new", to: "lists#new", as: :new_list
  get "lists/:id", to: "lists#show", as: :list
  post "/lists", to: "lists#create"
  get "/lists/:id/edit", to: "lists#edit", as: :edit_list
  patch "/lists/:id", to: "lists#update"
  delete "/lists/:id", to: "lists#destroy", as: :destroy_list

  delete "/favorites/:id", to: "favorites#destroy", as: :destroy_fav
end

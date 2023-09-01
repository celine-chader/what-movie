Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"

  get "/movies", to: "movies#index"
  resources :movies, only: [:show] do
    resources :favorites, only: [:new, :create]
  end

  resources :bookmarks, only: :destroy

  get "/lists", to: "lists#index"
  get "/lists/new", to: "lists#new", as: :new_list
  post "/lists", to: "lists#create"
  get "/lists/:id/edit", to: "lists#edit", as: :edit_list
  patch "/lists/:id", to: "lists#update"
  delete "/lists/:id", to: "lists#destroy"

  resources :lists, only: [:show] do
    resources :favorites, only: [:destroy]
  end

end

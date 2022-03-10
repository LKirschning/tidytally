Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/setup", to: "pages#setup"
  get "/roommate", to: "pages#roommate"
  get "/avatars", to: "pages#roommateavatar"
  get "/dashboard", to: "pages#dashboard"
  get "/select_household", to: "pages#select_household"
  resources :households, only: [:new, :create, :edit, :update]
  resources :rooms, only: [:index,:show, :new, :create] do
    resources :tasks, only: [:new, :create, :edit, :update]
  end
  post "/add-rooms", to: "rooms#add_room", as: :add_room

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

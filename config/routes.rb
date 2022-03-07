Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/setup", to: "pages#setup"
  get "/roommate", to: "pages#roommate"
  get "/dashboard", to: "pages#dashboard"
  resources :households, only: [:new, :create]
  resources :rooms, only: [:new, :create, :show, :index] do
    resources :tasks, only: [:new, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

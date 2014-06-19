Rails.application.routes.draw do

  root to:"galleries#index"  #to generate the regular index page

  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [:create]
  resource :session, only: [:create]

  get "/sign_up", to: "users#new"
  get "/sign_in", to: "sessions#new"

end

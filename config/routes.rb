Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  root to:"galleries#index"

  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :destroy]
  end

  resources :images, only: [:edit, :update, :show] do
    resources :comments, only: [:create]
  end

end

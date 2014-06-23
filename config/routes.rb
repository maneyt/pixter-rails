Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  root to:"galleries#index"  #to generate the regular index page

  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :destroy]
  end

  resources :images, only: [:edit, :update]

end

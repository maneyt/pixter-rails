Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :groups, only: [:new, :create, :index, :show] do
    resources :group_memberships, only: [:create, :destroy]
  end


  root to:"galleries#index"

  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :destroy]
  end

  resources :images, only: [:edit, :update, :show] do
    resources :group_images, only: [:create]
    resources :comments, only: [:create]
  end

end

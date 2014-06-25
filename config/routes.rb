Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index] do
    resource :follow, only: [:create]
  end
  resources :groups, only: [:new, :create, :index, :show] do
    resource :group_membership, only: [:create, :destroy]
  end


  root to:"galleries#index"

  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :destroy]
  end

  resources :images, only: [:edit, :update, :show] do
    resource :like, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

end

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index] do
    resource :follow, only: [:create]
  end
  resources :groups, only: [:new, :create, :index, :show] do
    resource :like_group, only: [:create, :destroy]
    resource :group_membership, only: [:create, :destroy]
  end


  root to:"galleries#index"

  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :destroy]
    resource :like_gallery, only: [:create, :destroy]
  end

  resources :tags, only: [:index, :show]


  resources :images, only: [:edit, :update, :show] do
    resource :like, only: [:create, :destroy]
    resources :tags, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

end

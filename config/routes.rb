Rails.application.routes.draw do
 #get "/" => "galleries#index"
 #get "/galleries/new" => "galleries#new"
 #get "/galleries/:id" => "galleries#show"
 #post "/galleries" => "galleries#create"
 #get "/galleries/:id/edit" => "galleries#edit"
 #patch "/galleries/:id" => "galleries#update"
 #delete "/galleries/:id" => "galleries#destroy"

  root to:"galleries#index"  #to generate the regular index page

  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :edit, :update, :destroy]
  end

end

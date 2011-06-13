GurupiOrg::Application.routes.draw do
  get "posts/show"

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout"                 => "sessions#destroy", :as => :signout

  resources :users, only: [:index]
  resources :posts, only: [:show]

  root :to => "welcome#index"
end

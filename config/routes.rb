GurupiOrg::Application.routes.draw do
  get "posts/show"

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout"                 => "sessions#destroy", :as => :signout

  resources :users, only: [:index]
  resources :posts, only: [:show]
  match "/users/:id/change/:role" => "users#change", :as => :change_user

  root :to => "welcome#index"
  match '/:controller(/:action(/:id))'
end

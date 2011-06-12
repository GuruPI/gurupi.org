GurupiOrg::Application.routes.draw do
  resources :events

  get "posts/show"

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout"                 => "sessions#destroy", :as => :signout
  resources :posts, only: :show
  root :to => "welcome#index"
end

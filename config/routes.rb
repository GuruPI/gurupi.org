GurupiOrg::Application.routes.draw do

  resources :events

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout"                 => "sessions#destroy", :as => :signout
  resources :posts, only: [:new, :show, :create], path_names: {new: 'novo'}
  root :to => "welcome#index"

end


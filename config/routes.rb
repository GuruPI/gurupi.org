GurupiOrg::Application.routes.draw do
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout"                 => "sessions#destroy", :as => :signout

  resources :users, only: [:index]
  resources :posts, only: [:new, :show, :create], path_names: {new: 'novo'}
  match "/users/:id/change/:role" => "users#change", :as => :change_user

  root :to => "welcome#index"
  match '/:controller(/:action(/:id))'
end

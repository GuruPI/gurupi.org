GurupiOrg::Application.routes.draw do
  resources :lectures

  match 'lectures/:id/vote_increment/', :controller => 'lectures', :action => 'vote_increment'
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout"                 => "sessions#destroy", :as => :signout

  resources :users, only: [:index]
  resources :posts, only: [:index, :new, :show, :create], path_names: {new: 'novo'}
  resources :events do
    resources :lectures
  end
  match "/users/:id/change/:role" => "users#change", :as => :change_user

  match "/about"  => "welcome#about"

  root :to => "welcome#index"
  match '/:controller(/:action(/:id))'
end


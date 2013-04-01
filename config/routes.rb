# encoding: UTF-8
GurupiOrg::Application.routes.draw do
  resources :lectures, :path => "palestras"

  match 'lectures/:id/vote_increment/', :controller => 'lectures', :action => 'vote_increment', :as => :vote
  match "/auth/:provider/callback" => "sessions#create"
  match "/auth/failure"            => "sessions#failure"
  match "/signout"                 => "sessions#destroy", :as => :signout

  resources :users, :path => "usuarios", only: [:index]
  resources :posts, only: [:index, :new, :show, :create], path_names: {new: 'novo'}
  resources :events, :path => "eventos" do
    resources :lectures
  end
  match "/users/:id/change/:role" => "users#change", :as => :change_user

  match "/about"  => "welcome#about", :path => "sobre"
  match "/contact"  => "welcome#contact", :path => "contato"

  root :to => "welcome#index"
  match '/:controller(/:action(/:id))'
  
  resources :certificates, :path => "certificados", :only => [:index, :create, :update, :show]
end


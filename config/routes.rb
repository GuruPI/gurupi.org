# encoding: UTF-8
GurupiOrg::Application.routes.draw do
  resources :lectures, path: "palestras"

  get 'lectures/:id/vote_increment/', controller: 'lectures', action: 'vote_increment', as: :vote
  get "/auth/:provider/callback" => "sessions#create"
  get "/auth/failure"            => "sessions#failure"
  get "/signout"                 => "sessions#destroy", as: :signout

  resources :users, path: "usuarios", only: [:index]
  resources :posts, only: [:index, :new, :show, :create], path_names: {new: 'novo'}
  resources :events, path: "eventos" do
    resources :lectures
  end
  get "/users/:id/change/:role" => "users#change", as: :change_user

  get "/about"    => "welcome#about",   path: "sobre"
  get "/contact"  => "welcome#contact", path: "contato"

  root to: "welcome#index"
  get '/:controller(/:action(/:id))'
end


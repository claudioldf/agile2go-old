Agile::Application.routes.draw do
  resources :tasks
  resources :sprints
  resources :projects
  resources :users

  devise_for :users, path: "auth"

  match 'dashboard', to: 'dashboard#index'
  match 'slug', to: "projects#show"
  match 'slug', to: "sprints#show"

  authenticated :user do
    root :to => "home#index"
  end
  root :to => "home#index"
end

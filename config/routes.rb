Agile::Application.routes.draw do
  resources :tasks
  resources :sprints
  resources :projects
  resources :users

  devise_for :users, path: "auth"
  # devise_for :users, path: 'auth',  controllers: {registrations: "devise/registrations", passwords: "devise/passwords"}

  match 'dashboard', to: 'dashboard#index'
  match 'slug', to: "projects#show"
  match 'slug', to: "sprints#show"

  authenticated :user do
    root to: "home#index"
  end
  root to: "home#index"
end

Agile::Application.routes.draw do
  resources :tasks


  resources :sprints


  resources :projects


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'users' }
  resources :users
end
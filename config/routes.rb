Agile::Application.routes.draw do
  resources :tasks
  resources :sprints
  resources :projects

  authenticated :user do    
    root :to => "home#index"      
  end
  devise_scope :user do
    get "sign_up", :to => "devise/resgistrations#new"
  end
  root :to => "home#index"  
  devise_for :users, :path => "auth"    
  resources :users
end
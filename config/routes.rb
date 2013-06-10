Agile::Application.routes.draw do
  resources :tasks
  resources :sprints
  resources :projects
  resources :users  

  match 'dashboard', :to => 'dashboard#index'   	    

  authenticated :user do    
    root :to => "home#index"      
  end  
  root :to => "home#index"  
  devise_for :users, :path => "auth" 
end
Agile::Application.routes.draw do
  resources :tasks
  resources :sprints
  resources :projects

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registration => 'registration' }, :path => "auth",
  :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' 
  #devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }
  resources :users
end
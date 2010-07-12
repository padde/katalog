Katalog::Application.routes.draw do |map|
  devise_for :users, :path_names => { :sign_up => 'register', :sign_in => 'log_in' }
  
  resources :things
  resources :people

  root :to => "people#index"
end

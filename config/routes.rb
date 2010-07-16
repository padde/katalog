Katalog::Application.routes.draw do |map|
  resources :groups

  devise_for :users,
    :path_names => { :sign_up => 'register', :sign_in => 'log_in' },
    :controllers => { :registrations => "users/registrations" }
  
  resources :things, :people
  
  match :identities, :to => 'people#identities'
  
  root :to => "things#index"
end

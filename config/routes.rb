Katalog::Application.routes.draw do |map|
  devise_for :users,
    :path_names => { :sign_up => 'register', :sign_in => 'log_in' },
    :controllers => { :registrations => "users/registrations" }
  
  resources :things, :people, :groups, :contexts
  
  #match :identities, :to => 'people#identities'
  
  root :to => "things#index"
end

ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  map.resources :people
  map.resources :groups
  map.resources :items
  map.resources :users
  
  map.root :controller => 'items'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

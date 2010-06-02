ActionController::Routing::Routes.draw do |map|
  map.resources :people, :groups, :items, :users
  map.root :controller => 'items'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

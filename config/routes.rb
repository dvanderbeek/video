Video::Application.routes.draw do
  
  resources :rooms
  
  match '/party/:id', :to => "rooms#show", :as => :party, :via => :get

  get "home/index"
  root :to => 'home#index'

end

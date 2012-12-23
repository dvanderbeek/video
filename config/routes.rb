Video::Application.routes.draw do
  
  resources :rooms
  
  match '/party/:id', :to => "rooms#party", :as => :party, :via => :get

  get "home/index"
  root :to => 'home#index'

end

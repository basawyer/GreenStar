TmStartupmad::Application.routes.draw do
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/faq',     :to => 'pages#faq'
  match '/profile', :to => 'users#profile'
  match '/outlets',  :to => 'users#outlets'
  match '/users/register_unit', :to => 'users#register_unit'
  match '/users/update_label', :to => 'users#update_label'
  match '/automation', :to => 'users#automation'
  match 'change_power/:id' => "slots#change_power"
  match '/get_latest_data/:slot' => "units#get_latest"
  match '/get_latest_slot_readings' => "users#get_latest_slot_readings"
  match '/outlets/:slot' => "users#outlet_detail"
  match 'submit' => 'units#submit'

resources :users do
  post :register_unit
end

 # match '/contact', :to => 'pages#contact'
 # match '/about',   :to => 'pages#about'
 # match '/help',    :to => 'pages#help'
  
  root :to => 'pages#home'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

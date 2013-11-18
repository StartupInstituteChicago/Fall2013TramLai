  Simple_restaurant::Application.routes.draw do
 
  devise_for :owners

  resources :restaurants do
    get 'guest', on: :collection
    resources :reservations
  resources :categories
  end
  root 'welcome#index'

  get "/owners/dashboard" => 'owners#dashboard'
  get "/owners/profile" => 'owners#profile'

  get "/categories/index" => 'categories#index'

  get "/categories/index/:category_id" => 'categories#show'
  
#  Prefix Verb   URI Pattern                                                 Controller#Action
#           new_owner_session GET    /owners/sign_in(.:format)                                   devise/sessions#new
#               owner_session POST   /owners/sign_in(.:format)                                   devise/sessions#create
#       destroy_owner_session DELETE /owners/sign_out(.:format)                                  devise/sessions#destroy
#              owner_password POST   /owners/password(.:format)                                  devise/passwords#create
#          new_owner_password GET    /owners/password/new(.:format)                              devise/passwords#new
#         edit_owner_password GET    /owners/password/edit(.:format)                             devise/passwords#edit
#                             PATCH  /owners/password(.:format)                                  devise/passwords#update
#                             PUT    /owners/password(.:format)                                  devise/passwords#update
#   cancel_owner_registration GET    /owners/cancel(.:format)                                    devise/registrations#cancel
#          owner_registration POST   /owners(.:format)                                           devise/registrations#create
#      new_owner_registration GET    /owners/sign_up(.:format)                                   devise/registrations#new
#     edit_owner_registration GET    /owners/edit(.:format)                                      devise/registrations#edit
#                             PATCH  /owners(.:format)                                           devise/registrations#update
#                             PUT    /owners(.:format)                                           devise/registrations#update
#                             DELETE /owners(.:format)                                           devise/registrations#destroy
#           guest_restaurants GET    /restaurants/guest(.:format)                                restaurants#guest
#     restaurant_reservations GET    /restaurants/:restaurant_id/reservations(.:format)          reservations#index
#                             POST   /restaurants/:restaurant_id/reservations(.:format)          reservations#create
#  new_restaurant_reservation GET    /restaurants/:restaurant_id/reservations/new(.:format)      reservations#new
# edit_restaurant_reservation GET    /restaurants/:restaurant_id/reservations/:id/edit(.:format) reservations#edit
#      restaurant_reservation GET    /restaurants/:restaurant_id/reservations/:id(.:format)      reservations#show
#                             PATCH  /restaurants/:restaurant_id/reservations/:id(.:format)      reservations#update
#                             PUT    /restaurants/:restaurant_id/reservations/:id(.:format)      reservations#update
#                             DELETE /restaurants/:restaurant_id/reservations/:id(.:format)      reservations#destroy
#       restaurant_categories GET    /restaurants/:restaurant_id/categories(.:format)            categories#index
#                             POST   /restaurants/:restaurant_id/categories(.:format)            categories#create
#     new_restaurant_category GET    /restaurants/:restaurant_id/categories/new(.:format)        categories#new
#    edit_restaurant_category GET    /restaurants/:restaurant_id/categories/:id/edit(.:format)   categories#edit
#         restaurant_category GET    /restaurants/:restaurant_id/categories/:id(.:format)        categories#show
#                             PATCH  /restaurants/:restaurant_id/categories/:id(.:format)        categories#update
#                             PUT    /restaurants/:restaurant_id/categories/:id(.:format)        categories#update
#                             DELETE /restaurants/:restaurant_id/categories/:id(.:format)        categories#destroy
#                 restaurants GET    /restaurants(.:format)                                      restaurants#index
#                             POST   /restaurants(.:format)                                      restaurants#create
#              new_restaurant GET    /restaurants/new(.:format)                                  restaurants#new
#             edit_restaurant GET    /restaurants/:id/edit(.:format)                             restaurants#edit
#                  restaurant GET    /restaurants/:id(.:format)                                  restaurants#show
#                             PATCH  /restaurants/:id(.:format)                                  restaurants#update
#                             PUT    /restaurants/:id(.:format)                                  restaurants#update
#                             DELETE /restaurants/:id(.:format)                                  restaurants#destroy
#                        root GET    /                                                           welcome#index
#            owners_dashboard GET    /owners/dashboard(.:format)                                 owners#dashboard
#              owners_profile GET    /owners/profile(.:format)                                   owners#profile
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

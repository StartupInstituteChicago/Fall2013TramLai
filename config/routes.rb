  Simple_restaurant::Application.routes.draw do
 
    devise_for :owners

    resources :restaurants do
      get 'guest', on: :collection
      resources :reservations
    end
    
    get "/categories/search" => 'categories#search'
    resources :categories
    
    root 'welcome#index'

    get "/owners/dashboard" => 'owners#dashboard'
    get "/owners/profile" => 'owners#profile'
    
  end
#     Prefix Verb   URI Pattern                                                 Controller#Action
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
#                 restaurants GET    /restaurants(.:format)                                      restaurants#index
#                             POST   /restaurants(.:format)                                      restaurants#create
#              new_restaurant GET    /restaurants/new(.:format)                                  restaurants#new
#             edit_restaurant GET    /restaurants/:id/edit(.:format)                             restaurants#edit
#                  restaurant GET    /restaurants/:id(.:format)                                  restaurants#show
#                             PATCH  /restaurants/:id(.:format)                                  restaurants#update
#                             PUT    /restaurants/:id(.:format)                                  restaurants#update
#                             DELETE /restaurants/:id(.:format)                                  restaurants#destroy
#                  categories GET    /categories(.:format)                                       categories#index
#                             POST   /categories(.:format)                                       categories#create
#                new_category GET    /categories/new(.:format)                                   categories#new
#               edit_category GET    /categories/:id/edit(.:format)                              categories#edit
#                    category GET    /categories/:id(.:format)                                   categories#show
#                             PATCH  /categories/:id(.:format)                                   categories#update
#                             PUT    /categories/:id(.:format)                                   categories#update
#                             DELETE /categories/:id(.:format)                                   categories#destroy
#                        root GET    /                                                           welcome#index
#            owners_dashboard GET    /owners/dashboard(.:format)                                 owners#dashboard
#              owners_profile GET    /owners/profile(.:format)                                   owners#profile
#                             GET    /categories/index/:category_id(.:format)                    categories#show
# unknownd8a25e969800:simple_restaurant tramlai$ rake routes
#                      Prefix Verb   URI Pattern                                                 Controller#Action
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
#                 restaurants GET    /restaurants(.:format)                                      restaurants#index
#                             POST   /restaurants(.:format)                                      restaurants#create
#              new_restaurant GET    /restaurants/new(.:format)                                  restaurants#new
#             edit_restaurant GET    /restaurants/:id/edit(.:format)                             restaurants#edit
#                  restaurant GET    /restaurants/:id(.:format)                                  restaurants#show
#                             PATCH  /restaurants/:id(.:format)                                  restaurants#update
#                             PUT    /restaurants/:id(.:format)                                  restaurants#update
#                             DELETE /restaurants/:id(.:format)                                  restaurants#destroy
#                  categories GET    /categories(.:format)                                       categories#index
#                             POST   /categories(.:format)                                       categories#create
#                new_category GET    /categories/new(.:format)                                   categories#new
#               edit_category GET    /categories/:id/edit(.:format)                              categories#edit
#                    category GET    /categories/:id(.:format)                                   categories#show
#                             PATCH  /categories/:id(.:format)                                   categories#update
#                             PUT    /categories/:id(.:format)                                   categories#update
#                             DELETE /categories/:id(.:format)                                   categories#destroy
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


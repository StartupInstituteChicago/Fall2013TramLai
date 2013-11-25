Simple_restaurant::Application.routes.draw do
  root 'welcome#index'
  devise_for :users

  resources :restaurants do
    resources :reservations
    resources :stars, except: [:show, :edit, :update, :destroy]
  end

  resources :users
  resources :stars, only: [:show, :edit, :update, :destroy]
  get "/categories/search" => 'categories#search'
  resources :categories



  get "/users/dashboard" => 'users#dashboard'
  get "/users/profile/" => 'users#profile'
    
end
                        
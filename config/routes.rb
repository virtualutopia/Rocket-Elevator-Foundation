Rails.application.routes.draw do


  resources :interventions do
    collection do 
      get :get_buildings_for_customer
      get :get_batteries_for_building
      get :get_columns_for_battery
      get :get_elevators_for_column
    end
  end

  resources :interventions

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  devise_for :employees
  devise_for :users
  
 #get "users/sign_out" => 'pages#index'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'pages#index'

  # get 'userinfo' => 'pages#userinfo'

  delete 'userinfo' => 'pages#destroy'

  delete 'index' => 'pages#destroy'





 post 'index' => 'pages#create'
 
 mount Blazer::Engine, at: "blazer"

  get 'home' => 'pages#home'


  get 'corporate'  => 'pages#corporate'

  get 'residential'  => 'pages#residential'

  get 'submission' => 'quotes#submission'

  post 'submission' => 'quotes#create'
 
  #get 'interventions' => 'interventions#index'

  get 'employee' => 'pages#employee'

  get 'submission' => 'pages#submission'

  
  get 'index' => 'pages#index'

  get 'users/index' => 'pages#index'
  
  get 'users/index' => 'pages#index'
  
  
  get 'employee' => 'pages#employee'
  
  get 'dashboard' => 'pages#dashboard'

  # Dropbox related routings
  # get 'dropbox/auth' => 'dropbox#auth'
  # get 'dropbox/auth_callback' => 'dropbox#auth_callback'

  get 'map' => 'gmap#gmap'
  
  get '/watson/watson' => 'watson#watson'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  get 'covid' => 'pages#covid'

  # just for tests RSpec
  # get 'users/interventions' => 'interventions#index'
  get '/font/revicons.woff' => 'pages#home'
  get '/assets/loader.gif' => 'pages#home'
  get '/font/revicons.ttf' => 'pages#home'
end

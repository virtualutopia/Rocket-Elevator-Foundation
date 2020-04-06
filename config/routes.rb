Rails.application.routes.draw do


  resources :interventions
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
 
  get 'interventions' => 'interventions#index'

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

  #Interventions page
  # get '/interventions' => 'interventions#index'

end

Rails.application.routes.draw do
  
  resources :location_images
# omniauth facebook
  devise_for :users, :controllers => { 
  	:omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "registrations"
  	#:confirmations => "confirmations"
  } 

  get '/main/home' => 'main#welcome'
  get '/users/welcome' => 'user#welcome'
  get '/locations/:id/delete' => 'locations#delete', :as => :delete_location
  get '/projects/:id/delete' => 'projects#delete', :as => :delete_project
  get '/ads/:id/delete' => 'ads#delete', :as => :delete_ad
  get '/tasks/:id/delete' => 'tasks#delete', :as => :delete_task
  get '/location_image/:id/delete' => 'location_images#delete', :as => :delete_location_images

  resources :developers, :hosts, :projects, :locations, :ads, :tasks

  match 'user_root' => 'user#welcome', as: :user_root, :via => :get
  
  root :to => 'main#welcome'
end











=begin
  do
  get '/users/connect/:network', :to => redirect("/users/auth/%{network}"), :as => 'user_oauth_connect'
  end

 log out
 devise_scope :user do
  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
 end  
=end
Rails.application.routes.draw do
  # Default Devise routes for users and administrators
  devise_for :users
  devise_for :administrators

  # Define custom sign-out routes for both users and administrators
  # devise_scope :user do
  #   delete '/logout', to: 'devise/sessions#destroy', as: :user_logout
  # end

  # devise_scope :administrator do
  #   delete '/logout_admin', to: 'devise/sessions#destroy', as: :administrator_logout
  # end
  resources :bookings do
    put :update_status, on: :member
  end


  # Define RESTful routes for managing services
  resources :services

  # Define RESTful routes for managing administrators
  resources :administrators

  # Define RESTful routes for managing bookings
  resources :bookings
  # resources :bookings, only: [:update]

  # Define route for admin dashboard
  get 'dashboard', to: 'bookings#dashboard', as: 'admin_dashboard'

  # Define RESTful routes for managing users
  resources :users

  # Define other routes...
  get 'pages/welcome'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'pages#welcome'
end

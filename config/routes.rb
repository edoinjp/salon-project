Rails.application.routes.draw do
  # Define RESTful routes for managing services
  resources :services

  # Define RESTful routes for managing administrators
  resources :administrators

  # Define RESTful routes for managing bookings
  resources :bookings

  # Define RESTful routes for managing users
  resources :users

  # Define other routes...
  get 'pages/welcome'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'pages#welcome'

  delete '/services/:id', to: 'services#destroy'

 #  default URL options for Devise in development environment ( must be changed when go on production)
 config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
end

Rails.application.routes.draw do
  # Define RESTful routes for managing services
  resources :services
  resources :administrators
  resources :bookings
  resources :user
   # routes...
  get 'pages/welcome'
  get 'administrators/index'
  get 'administrators/show'
  get 'administrators/new'
  get 'administrators/create'
  get 'administrators/edit'
  get 'administrators/update'
  get 'administrators/destroy'
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/edit'
  get 'bookings/update'
  get 'bookings/destroy'
  get 'services/index'
  get 'services/show'
  get 'services/new'
  get 'services/create'
  get 'services/edit'
  get 'services/update'
  get 'services/destroy'
  get 'user/new'
  get 'user/create'
  get 'user/edit'
  get 'user/update'
  get 'user/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'pages#welcome'


end

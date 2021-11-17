Rails.application.routes.draw do
  resources :schedules
  resources :appointments
  resources :doctors
  resources :patients
  devise_for :users
  resources :messages
  resources :rooms
  # get '/dashboard', to: 'rooms#dashboard', as: 'dashboard'
  # get '/rooms/:id/chat', to: 'rooms#room'
  get '/users/:id/profile', to: 'users#profile' 
  get '/users/:id/appointments', to: 'users#appointment' 
  get '/users/:id/med_record', to: 'users#med_record' 
  get '/users', to: 'users#index' 
  get '/users/editinfo', to: 'users#editinfo' 
  put '/users/update', to: 'users#update' 
  get '/appointments/:id/calendar', to: 'appointments#calendar'
  get 'active-sessions', to: "appointments#active_sessions"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
  
end

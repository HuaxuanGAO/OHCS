Rails.application.routes.draw do
  resources :doctors
  resources :patients
  devise_for :users
  resources :messages
  resources :rooms
  get '/dashboard', to: 'rooms#dashboard', as: 'dashboard'
  get '/rooms/:id/chat', to: 'rooms#room'
  get '/doctors/:id/profile', to: 'doctors#profile' 
  get '/doctors', to: 'doctors#index' 
  get '/doctors/editinfo', to: 'doctors#editinfo' 
  put '/doctors/update', to: 'doctors#update'
  get '/patients/:id/profile', to: 'patients#profile'
  get '/patients', to:'patients#index'
  get '/patients/editinfo', to: 'patients#editinfo'
  put '/patients/update', to: 'patients#update'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
  
end

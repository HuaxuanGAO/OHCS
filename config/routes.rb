Rails.application.routes.draw do
  resources :doctors
  resources :patients
  devise_for :users
  resources :messages
  resources :rooms
  get '/dashboard', to: 'rooms#dashboard', as: 'dashboard'
  get '/rooms/:id/chat', to: 'rooms#room'
  get '/users/:id/profile', to: 'users#profile' 
  get '/users', to: 'users#index' 
  get '/users/editinfo', to: 'users#editinfo' 
  put '/users/update', to: 'users#update' 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
  
end

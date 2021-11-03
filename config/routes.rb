Rails.application.routes.draw do
  resources :messages
  resources :rooms
  get '/dashboard', to: 'rooms#dashboard', as: 'dashboard'
  get '/rooms/:id/chat', to: 'rooms#room'
  devise_for :doctors
  as :doctors do
    get '/doctors/:id/profile', to: 'doctors#profile' 
    get '/doctors', to: 'doctors#index' 
    get '/doctors/editinfo', to: 'doctors#editinfo' 
    put '/doctors/update', to: 'doctors#update'
  end
  # devise_scope :doctors do
  #   authenticated  do
  #     root to: 'doctors#profile'
  #   end
  #   unauthenticated do
  #     root controller: :patients, action: :login
  #   end
  # end
  devise_for :patients
  as :patients do 
    get '/patients/:id/profile', to: 'patients#profile'
    get '/patients', to:'patients#index'
    get '/patients/editinfo', to: 'patients#editinfo'
    put '/patients/update', to: 'patients#update'
  end
  # devise_scope :patients do
  #   authenticated do
  #     root to: 'patients#profile'
  #   end
  #   unauthenticated do
  #     root controller: :patients, action: :login
  #   end
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root controller: :patients, action: :login
  
end

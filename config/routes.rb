Rails.application.routes.draw do
  root 'flights#index'

  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :flights, only: [:index]
  resources :bookings, only: [:new, :create, :show, :index]
  resources :users, only: [:new, :create, :show]
end

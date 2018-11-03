Rails.application.routes.draw do

  devise_for :userrests, path: 'userrests', controllers: {registrations: 'userrests/registrations'}
  devise_for :customers, path: 'customers', controllers: {sessions: "customers/sessions", registrations: 'customers/registrations'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants do
    resources :customers
    resources :reservations
    resources :menuitems
    resources :categories
    resources :reviews, except: [:index, :show]
  end

  resources :customers do
  resources :reservations
  resources :restaurants
  resources :menuitems
  end

  resources :categories do
    resources :restaurants
  end

  resources :signups, :path => "signup"

  get '/seatstaken', to: 'menuitems#ajax', as: 'seatstaken'

  root to: "restaurants#index"
end

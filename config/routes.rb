Rails.application.routes.draw do

  devise_for :userrests, path: 'userrests', controllers: {registrations: 'userrests/registrations'}
  devise_for :customers, path: 'customers', controllers: {registrations: 'customers/registrations'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :customers do
    resources :restaurants
    resources :reservations
  end

  resources :restaurants do
    resources :customers
    resources :reservations
    resources :menuitems
  end

  root to: "restaurants#index"
end

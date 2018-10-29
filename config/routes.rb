Rails.application.routes.draw do

  devise_for :userrests, path: 'userrests', controllers: {sessions: 'userrests/sessions', registrations: 'userrests/registrations'}
  devise_for :customers, path: 'customers', controllers: {sessions: 'customers/sessions'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants do
  resources :menuitems
  end

  resources :customers do
  resources :reservations
  resources :restaurants
  resources :menuitems
  end

  root to: "restaurants#index"
end

Rails.application.routes.draw do
  devise_for :userrests, path: 'userrests', controllers: {sessions: 'userrests/sessions'}
  devise_for :customers, path: 'customers', controllers: {sessions: 'customers/sessions'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end

Rails.application.routes.draw do
  resources :releases
  resources :labels
  resources :spins
  resources :djs
  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to:  'spins#index'
end

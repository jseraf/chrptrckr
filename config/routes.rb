Rails.application.routes.draw do
  resources :releases
  resources :labels
  resources :spins
  resources :djs, only: [:index, :show] do
    resources :artists, on: :member, only: [:index, :show], controller: 'djs/artists'
  end
  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to:  'spins#index'
end

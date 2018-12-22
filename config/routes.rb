Rails.application.routes.draw do
  resources :releases
  resources :labels
  resources :spins do
    collection do
      post 'search', controller: 'spins/search'
    end
  end
  resources :djs, only: %i[index show] do
    resources :artists, on: :member, only: %i[index show], controller: 'djs/artists'
  end
  resources :artists, only: %i[index show] do
    resources :releases, on: :member, only: %i[index show], controller: 'artists/releases'
  end

  get 'most-played', to: 'most_played#index'

  root to: 'spins#index'
end

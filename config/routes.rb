Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"

  get "choose_preferences", to: "users#choose"
  post "choosen", to: "users#choosen"

  # get 'user', to: 'users#index'

  resources :users, only: [:show, :destroy]
  resources :favorites, only: [:index,:show, :destroy]
  resources :arks, only: [:index, :show] do
    resources :favorites, only: [:new, :create]
    member do
      get 'related_arks', to: 'arks#related_arks'
      get 'alternative_ark', to: 'arks#alternative_ark'
    end
  end
end

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"

  get "choose_preferences", to: "users#choose"

  # get 'user', to: 'users#index'
  resources :users, only: [:show]
  resources :arks, only: [:index, :show] do
    resources :favorites, only: [:index, :create, :destroy]
    member do
      get 'related_arks', to: 'arks#related_arks'
    end
  end
end

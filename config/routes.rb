Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "arks#daily_show"

  get "choose_preferences", to: "users#choose"

  get 'user', to: 'users#index'
  resources :arks, only: [:index, :show] do
    resources :favorites, only: [:index, :create, :destroy]
  end
end

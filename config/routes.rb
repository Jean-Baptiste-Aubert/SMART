Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'user', to: 'users#index'
  resources :arks, only: [:index, :show] do
    resources :favorites, only: [:index, :create, :destroy]
    member do
      get 'related_arks', to: 'arks#related_arks'
    end
  end
end

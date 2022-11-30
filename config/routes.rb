Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'user', to: 'users#index'
  resources :arks, only: [:index, :show] do
    resources :favorites, only: [:index, :create, :destroy]
  end
end

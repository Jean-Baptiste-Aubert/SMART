Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  ressources :arks, only: [:index, :show] do
    ressources :favorites, only: [:index, :create, :destroy]
  end
end

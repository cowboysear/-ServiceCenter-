
Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'

  resources :binders do
    resources :sellables
  end
  resource :profile, only: [:show]
end
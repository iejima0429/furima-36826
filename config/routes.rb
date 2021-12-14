Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :sold_outs, only: [:new, :create]
  resources :items do
    resources :orders, only: [:index, :create]
  end
 end
 
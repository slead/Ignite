Rails.application.routes.draw do

  devise_for :users

  resources :events
  resources :about
  resources :find
  resources :start

  root to: "home#index"
end

Rails.application.routes.draw do

  devise_for :users

  resources :events do
    resources :videos
  end
  resources :about
  resources :start

  root to: "home#index"
end

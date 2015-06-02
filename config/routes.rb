Rails.application.routes.draw do

  devise_for :users

  resources :events do
    resources :videos
  end
  resources :about
  resources :start
  resources :videos

  root to: "home#index"
end

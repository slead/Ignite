Rails.application.routes.draw do

  devise_for :users

  resources :events do
    resources :videos
  end

  resources :videos
  resources :upcomings

  get ':content', to: 'content#show'

  root to: "content#home"
end

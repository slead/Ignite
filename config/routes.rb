Rails.application.routes.draw do

  devise_for :users

  resources :events do
    resources :videos
  end

  get ':content', to: 'content#show'

  root to: "content#home"
end

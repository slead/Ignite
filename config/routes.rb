Rails.application.routes.draw do

  devise_for :users

  resources :events do
    resources :videos
  end

  resources :videos
  resources :upcomings

  get '/about', to: 'content#about', as: :about #=> about_path
  get '/start', to: 'content#start', as: :start #=> about_path

  get '/:id', to: 'events#show', as: :event_page

  root to: "content#home"

end

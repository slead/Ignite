Rails.application.routes.draw do

  devise_for :users

  resources :events do
    resources :videos
  end

  resources :contacts, only: [:new, :create]
  resources :videos
  resources :upcomings

  get '/admin', to: 'admin#index', as: :admin #=> admin_path
  get '/start', to: 'content#start', as: :start #=> about_path
  get '/contact', to: 'contacts#new', as: :contact
  get '/:id', to: 'events#show', as: :event_page

  root to: "content#home"

end

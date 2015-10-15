Rails.application.routes.draw do

  devise_for :users
  scope "/admin" do
    resources :users
  end

  resources :events do
    resources :videos
    resources :playlists
  end

  resources :contacts, only: [:new, :create]
  resources :videos
  resources :upcomings
  resources :roles
  resources :tags
  resources :playlists

  get '/about', to: 'content#about', as: :about #=> about_path
  get '/admin', to: 'admin#index', as: :admin #=> admin_path
  get '/contact', to: 'contacts#new', as: :contact #=> contact_path
  get '/feedback', to: 'contacts#new', as: :feedback #=> contact_path
  get '/start', to: 'content#start', as: :start #=> start_path
  get '/:id', to: 'events#show', as: :event_page

  root to: "content#home"

end

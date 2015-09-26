Rails.application.routes.draw do

  devise_for :users, :path_prefix => 'd' # routes for devise modules on User
  resources :users # custom admin-type CRUD for users

  resources :events do
    resources :videos
  end

  resources :contacts, only: [:new, :create]
  resources :videos
  resources :upcomings
  resources :posts, except: [:index]

  get '/about', to: 'content#about', as: :about #=> about_path
  get '/admin', to: 'admin#index', as: :admin #=> admin_path
  get '/contact', to: 'contacts#new', as: :contact #=> contact_path
  get '/feedback', to: 'contacts#new', as: :feedback #=> contact_path
  get '/blog', to: 'posts#index', as: :blog #=> blog_path
  get '/start', to: 'content#start', as: :start #=> start_path
  get '/:id', to: 'events#show', as: :event_page

  root to: "content#home"

end

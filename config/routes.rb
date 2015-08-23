Rails.application.routes.draw do

  devise_for :users

  resources :ignites do
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
  get '/:id', to: 'ignites#show', as: :ignite_page

  root to: "content#home"

end

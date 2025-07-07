Rails.application.routes.draw do
  # Root route
  root 'home#index'

  # Static pages
  get '/about', to: 'about#index'
  get 'search', to: 'search#index'

  # Authentication
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # User and Admin dashboards
  get '/admin', to: 'home#aindex'
  get '/userhome', to: 'home#uindex'
  get '/your-quotes', to: 'home#uquotes'
  get '/details', to: 'home#udetails'
  get '/details/:id', to: 'home#display', as: 'quote_display'
  get 'uindex', to: 'home#uindex'
  get 'adetails', to: 'home#adetails', as: 'adetails'
  get 'users/:id/per_update', to: 'users#per_update', as: 'per_update_user'
  

  # User management with status actions
  resources :users do
    member do
      patch :suspend
      patch :ban
      patch :activate
    end
  end

  # Other resources
  resources :categories
  resources :quotes
  resources :authors
end

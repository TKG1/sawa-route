Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users, only: %i[new create]
  resource :profiles, only: %i[show edit update]

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', :as => :logout

  get 'oauth/callback' => 'oauths#callback'
  post 'oauth/:provider' => 'oauths#oauth', :as => :auth_at_provider

  get 'maps' => 'maps#index'
end

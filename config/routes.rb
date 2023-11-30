Rails.application.routes.draw do
  resources :products
  resources :cataloges
 
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  authenticated :user do
    root 'profiles#show', as: :authenticated_root
  end

  get '/logout', to: 'profiles#logout', as: 'logout'

  
  resource :profiles, only: [:edit, :update, :destroy] do  
    collection do 
      get :manager
      get :customer
    end
  end
 
  delete 'profiles/:id', to: 'profiles#destroy', as: 'delete_profile'

  root to: "home#index"
end


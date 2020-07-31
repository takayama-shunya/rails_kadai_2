Rails.application.routes.draw do
  
  root to: 'sessions#new' 

  resources :blogs do
    collection do
      post :confirm
      patch :confirm
    end
    member do
      patch :confirm
      get :favorited
    end
    resource :favorites, only: [:create, :destroy]
  end

  resources :users 
  resources :sessions, only: [:new, :create, :destroy]

end

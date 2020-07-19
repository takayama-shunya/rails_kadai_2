Rails.application.routes.draw do
  
  root to: 'sessions#new' 

  resources :blogs do
    collection do
      post :confirm
      patch :confirm
    end
    member do
      patch :confirm
    end
  end

  resources :users, only: [:new, :create, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

end
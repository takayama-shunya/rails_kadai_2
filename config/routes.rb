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
    resources :comments
  end

  resources :users 
  resources :sessions, only: [:new, :create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end

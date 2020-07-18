Rails.application.routes.draw do
  
  #root to: 'session#new' 

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

end

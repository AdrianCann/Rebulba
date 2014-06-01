Rebulba::Application.routes.draw do
  resources :users, except: [:index] do
    resources :followings, only: [:create]
  end

  resources :posts, only: [:create, :update, :destroy, :show] do
    resources :comments, only: [:create, :update]
    resources :likes, only: [:create]
  end

  resources :comments, only: [] do
    resources :likes, only: [:create]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :comments, only: [:destroy]
  resources :likes, only: [:destroy]
  resources :followings, only: [:destroy]
  
  resources :notifications, only: [:show, :destroy]


  root to: "sessions#new"
  
  namespace :api, :defaults => { :format => :json } do

    resources :posts, only: [:index, :create, :update, :destroy, :show] do
      
    end
    resources :likes, only: [:create]
    
    resources :comments, only: [:create, :update, :destroy]
		
		resources :likes, only: [:destroy]
  end
  
  get 'auth/facebook/callback', to: 'sessions#create'

end
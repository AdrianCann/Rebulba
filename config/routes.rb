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


  root to: "sessions#new"
end

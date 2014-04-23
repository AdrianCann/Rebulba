Rebulba::Application.routes.draw do
  resources :users do
    resources :posts, except: [:destroy, :edit] do
      resources :comments, only: [:create, :update] do
        resources :likes, only: [:create]
      end
    end
    resources :followings, only: [:create, :destroy]
  end
  resource :session
  resources :posts, only: [:destroy] do
    resources :likes, only: [:create]

  end
  resources :comments, only: [:destroy]
  resources :likes, only: [:destroy]


  root to: "users#new"
end

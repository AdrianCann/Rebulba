Rebulba::Application.routes.draw do
  resources :users do
    resources :posts, except: [:destroy, :edit] do
      resources :comments, only: [:create, :update]
    end
    resources :followings, only: [:create, :destroy]
  end
  resource :session
  resources :posts, only: [:destroy]
  resources :comments, only: [:destroy]


  root to: "users#new"
end

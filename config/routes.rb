Rebulba::Application.routes.draw do
  resources :users do
    resources :posts, except: [:destroy, :edit]
    resources :followings, only: [:create, :destroy]
  end
  resource :session
  resources :posts, only: [:destroy]


  root to: "users#new"
end

Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: [:create]
  end
  resources :users, except: [ :index  ]
  resources :categories, only: %i[new create show]
  get 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'
  get '/articles/:article_id/vote', to: 'votes#create', as: 'vote'
  get '/articles/:article_id/unvote', to: 'votes#destroy', as: 'unvote'
  get 'users/:id/delete', to: 'users#destroy', as: 'delete_user'
  post 'login', to: 'sessions#create'
  root to: 'articles#index'
end

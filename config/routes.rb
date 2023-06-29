Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users, path: 'auth',
                     path_names: { sign_in: 'login', password: 'secret', sign_up: 'register' }
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy', as: :logout
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_post'
  post '/users/:user_id/posts', to: 'posts#create', as: 'create_post'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get '/users/:user_id/posts/:id/comments/new', to: 'comments#new', as: 'new_comment'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create', as: 'create_comment'
  get '/users/:user_id/posts/:id/like', to: 'likes#create', as: 'create_like'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users', to: 'users#index', as: 'users'
end

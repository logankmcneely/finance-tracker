Rails.application.routes.draw do
  root 'welcome#index'
  get 'users/my_portfolio'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'my_connections', to: 'users#my_connections'
  get 'search_user', to: 'users#search'
  get 'refresh_tracked_stocks', to: 'stocks#refresh_tracked_stocks'
  resources :stocks, only: [:show]
  resources :users, only: [:show], :constraints => { :id => /[0-9|]+/ }
  resources :user_stocks, only: [:create, :destroy]
  resources :connections, only: [:create, :destroy]
  devise_for :users
end

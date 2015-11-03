Rails.application.routes.draw do
  resources :songs
  resources :users, only: [:new, :create, :show]
end

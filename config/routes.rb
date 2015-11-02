Rails.application.routes.draw do
  resources :songs

  get '/songs', to: "songs#index"
end

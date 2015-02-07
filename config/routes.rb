Rails.application.routes.draw do
  root 'topics#index'
  resources :topics, only: [:index, :create]
end

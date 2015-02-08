Rails.application.routes.draw do
  root 'topics#index'
  resources :topics
end

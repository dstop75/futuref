Rails.application.routes.draw do
  root 'topics#index'
  resources :topics, shallow: true do
    resources :resources, only: [:index, :new]
  end
end

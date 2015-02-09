Rails.application.routes.draw do
  root 'topics#index'
  resources :topics, shallow: true do
    resources :resources, only: [:new, :edit, :create, :update, :destroy], shallow: true do
      resources :comments
    end
  end
end

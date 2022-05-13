Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show destroy] do
    resources :posts, only: %i[index show new create destroy update] do
      resources :comments, only: %i[new create create destroy update]
      resources :likes, only: %i[new create]
    end
  end
  
  root "users#index"
end

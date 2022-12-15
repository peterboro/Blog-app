Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, only: %i[index show destroy] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy] 
      resources :likes, only: %i[new create destroy]
    end
 end
end

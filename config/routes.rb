Rails.application.routes.draw do
  resources :user_top100_tracks, only: [:index, :create]
  resources :top100_tracks, only: [:index, :create]
  resources :users, only: [:index, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

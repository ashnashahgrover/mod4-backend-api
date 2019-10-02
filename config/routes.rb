Rails.application.routes.draw do
  resources :user_top100_tracks, only: [:index, :create]
  resources :top100_tracks, only: [:index, :create]
  resources :users, only: [:index, :create, :update, :show, :update, :destroy]
  post '/users/:id/compare', to: 'users#compare', as: :compare

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

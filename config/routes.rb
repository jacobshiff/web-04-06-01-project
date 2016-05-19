Rails.application.routes.draw do

  #resources :memes, only: [:index]

  # resources :groups, only: [:index, :show], params: :slug do
  #   resources :memes, only: [:index, :show]
  # end

  # # Login
  # get '/:group_slug/login' => 'sessions#new', as: 'login'
  # post '/:group_slug/login' => 'sessions#create', as: 'login'

  # Registration
  # get '/:group_slug/users/new' => 'registration#new', as: 'registration'
  # post '/:group_slug/users' => 'registration#new', as: 'registration_new'
  resources :user


  get '/:group_slug/memes' => 'memes#index', as: 'memes'
  get '/:group_slug/memes/:id' => 'memes#show', as: 'meme'
end

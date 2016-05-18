Rails.application.routes.draw do

  resources :memes, only: [:index]

  get '/:group_slug/memes' => 'memes#index'

  # This needs to go last
  get '/:group_slug/' => 'memes#index'
  get '/:group_slug/memes/:id' => 'memes#show'
end

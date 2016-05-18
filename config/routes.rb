Rails.application.routes.draw do

  #resources :memes, only: [:index]

  # resources :groups, only: [:index, :show], params: :slug do
  #   resources :memes, only: [:index, :show]
  # end

  get '/:group_slug/memes' => 'memes#index', as: 'memes'
  get '/:group_slug/memes/:id' => 'memes#show', as: 'meme'
end

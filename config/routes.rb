Rails.application.routes.draw do
  # This needs to go last
  get '/:group_slug/', to: 'memes#index'
  get '/:group_slug/memes/:meme_id', to: 'memes#show'
end

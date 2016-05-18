Rails.application.routes.draw do
  # This needs to go last
  get '/:group_slug/memes', to: 'memes#index', as: "memes"
  get '/:group_slug/memes/:meme_id', to: 'memes#show', as: "meme"
end

Rails.application.routes.draw do
  # This needs to go last
  get '/:group_slug/', to: 'memes#index'
  get '/:group_slug/memes/:id', to: 'memes#show'
end

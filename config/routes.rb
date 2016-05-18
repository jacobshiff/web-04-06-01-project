Rails.application.routes.draw do
  # This needs to go last
  get '/:group_slug/', to: 'memes#index'
end

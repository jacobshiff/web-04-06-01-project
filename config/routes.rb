Rails.application.routes.draw do

  resources :memes, only: [:index]
  
  get '/:group_slug/memes', to: 'memes#index', as: 'homepage'

  # # This needs to go last
  # get '/groups/:group_slug', as: '/:group_slug', to:
end

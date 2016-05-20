Rails.application.routes.draw do

  #resources :memes, only: [:index]

  # resources :groups, only: [:index, :show], params: :slug do
  #   resources :memes, only: [:index, :show]
  # end


  ######## Home routes
  get '/' => 'home#index', as: 'home'

######### Memes routes
  #Create
  get '/:group_slug/memes/new' => 'memes#new'
  post '/:group_slug/memes' => 'memes#create'

  #Show
  get '/:group_slug/memes' => 'memes#index', as: 'memes'
  get '/:group_slug/memes/:id' => 'memes#show', as: 'meme'
  post '/:group_slug/memes/:id/react' => 'memes#react', as: :react

  #Destroy
  delete '/:group_slug/memes/:id' => 'memes#destroy'

######## Users
  # Login
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create', as: 'create_login'

  # Logout
  delete '/:group_slug/logout' => 'sessions#destroy', as: 'logout'

  # Registration
  get '/users/new' => 'registrations#new', as: 'registration_new'
  post '/users/new' => 'registrations#create', as: 'registration_create'

  # User path
  get '/:group_slug/users/:username' => 'users#show', as: 'user'
  get '/:group_slug/users/:username/edit' => 'users#edit', as: 'edit_user'
  patch '/:group_slug/users/:username' => 'users#update'
  delete '/:group_slug/users/:username' => 'users#destroy'

  #user profile page
  #can rewrite with user_slug
  get '/users/:user_id' => 'users#show'
  get '/users/:user_id/edit' => 'users#edit'

end

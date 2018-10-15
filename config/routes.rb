Rails.application.routes.draw do

  resources :settings
  resources :criminals
  resources :cases
  resources :face_video_analyses
  root to: 'emotions#index'
  resources :emotions
  post '/add_video/:id', to: 'face_video_analyses#add_video'
  get '/get_video/:id', to: 'face_video_analyses#get_video'

  mount ActionCable.server => '/cable'

end

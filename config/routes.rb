Rails.application.routes.draw do

  resources :face_video_analyses
  root to: 'emotions#index'
  resources :emotions
  mount ActionCable.server => '/cable'

end

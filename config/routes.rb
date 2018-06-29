Rails.application.routes.draw do

  root to: 'emotions#index'
  resources :emotions
  mount ActionCable.server => '/cable'

end

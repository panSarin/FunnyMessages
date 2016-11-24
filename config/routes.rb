Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#new'

  mount ActionCable.server => '/cable'

  resources :users, only: [:new, :create]
  resources :messages, only: [:create]
  resource :chat, only: [:show]
end

Rails.application.routes.draw do
  root 'events#index'

  resources :events
  resources :requests
  resources :asistants
  resources :rooms
end

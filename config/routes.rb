Rails.application.routes.draw do
  resources :rooms
  root 'events#index'

  resources :events
  resources :requests
  resources :asistants
end

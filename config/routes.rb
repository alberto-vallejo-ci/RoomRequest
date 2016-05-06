Rails.application.routes.draw do
  root 'events#index'

  resources :events
  resources :applications
  resources :asistants
  resources :rooms
end

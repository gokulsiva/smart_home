Rails.application.routes.draw do
  get 'manual/index'
  get 'manual/toggle'

  resources :controls
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  get 'home/index'
  get 'home/edit'

  get 'manual/index'
  get 'manual/toggle'

  resources :controls
  resources :main_switches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

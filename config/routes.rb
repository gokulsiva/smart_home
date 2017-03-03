Rails.application.routes.draw do

  root :to => 'index#index'

  get 'login/login'
  get 'login/login'
  post 'login/attempt_login'
  get 'login/logout'

  get 'index/index'

  get 'stream/index'

  get 'home/index'
  get 'home/edit'

  get 'manual/index'
  get 'manual/toggle'

  resources :admin_users
  resources :controls
  resources :main_switches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

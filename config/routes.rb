Rails.application.routes.draw do
  devise_for :users
  resources :movie
  root to: 'movie#index'
  get 'statics/team'
  get 'statics/contact'
  get 'statics/privacy'

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

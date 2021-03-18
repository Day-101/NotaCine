Rails.application.routes.draw do
  devise_for :users
  resources :movies
  resources :users, only: [:show] do
  	resources :avatars, only: [:create]
  end
  root to: 'movies#index'
  get 'statics/team'
  get 'statics/contact'
  get 'statics/privacy'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

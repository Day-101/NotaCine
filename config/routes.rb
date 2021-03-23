Rails.application.routes.draw do
  devise_for :users
  resources :movies do
    resources :notations, only: [:new, :create, :edit, :update]
    resources :comments, except: [:new, :show, :index]
  end
  resources :users, only: [:show, :destroy] do
  	resources :avatars, only: [:create]
  end
  root to: 'movies#index'
  get 'statics/team'
  get 'statics/contact'
  get 'statics/privacy'
  get 'statics/how'

  get "/search", to: "searches#new"
  resources :searches, only: [:create]

  get "/admin", to: "admins#show"
  resources :admins #, only: [:update, :edit]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

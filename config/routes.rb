Rails.application.routes.draw do
  devise_for :users
  resources :movie

  get "/team", to: "statics#team"
  get "/contact", to: "statics#contact"
  get "/rgpd", to: "statics#rgpd"



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

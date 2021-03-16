Rails.application.routes.draw do
  devise_for :users
  resources :movie

  get "/team", to: "static#team"
  get "/contact", to: "static#contact"
  get "/rgpd", to: "static#rgpd"

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

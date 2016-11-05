Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :congregations
  get 'dashboard', to: "dashboard#index", as: :dashboard
end

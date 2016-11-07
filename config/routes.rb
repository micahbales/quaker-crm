Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :meetings
  resources :individuals
  get 'dashboard', to: "dashboard#index", as: :dashboard
end

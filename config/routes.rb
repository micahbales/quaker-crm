Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :meetings
  get 'dashboard', to: "dashboard#index", as: :dashboard
end

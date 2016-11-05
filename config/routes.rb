Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :congregations
  namespace :dashboard do
    root "dashboard#index"
  end
end

Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  namespace :dashboard do
    root "congregations#index"
  end
end

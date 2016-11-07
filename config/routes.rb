Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :meetings do
    resources :individuals
  end
  get 'dashboard', to: "dashboard#index", as: :dashboard
end

Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :meetings do
    resources :individuals
    resources :groups
  end
  resources :group_assignments
  get 'dashboard', to: "dashboard#index", as: :dashboard
end

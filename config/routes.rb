Rails.application.routes.draw do
  root "home#index"
  get 'dashboard', to: "dashboard#index", as: :dashboard
  devise_for :users
  resources :meetings do
    resources :individuals, except: [:index]
    resources :groups, except: [:index]
  end
  resources :group_assignments, only: [:create, :destroy]
  post 'add_or_remove', to: "group_assignments#add_or_remove"
end

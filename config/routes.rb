Rails.application.routes.draw do
  devise_for :users
  resources :expense
  resources :groups do
    resources :expense_groups, only: [:new, :index, :create]
  end
  #resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")  
  root "groups#index"
end

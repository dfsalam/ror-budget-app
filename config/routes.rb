Rails.application.routes.draw do
  devise_for :users
  resources :expense_groups
  resources :groups
  resources :expenses
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/splash', to:'users#splash', as: 'splash'  
  root "groups#index"
end

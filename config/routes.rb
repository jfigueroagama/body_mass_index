Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home_page#home'
  resources :body_masses, only: [:new, :create, :show]
  devise_for :users
end

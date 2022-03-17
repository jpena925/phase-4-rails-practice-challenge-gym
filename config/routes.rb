Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :memberships, only: [:create]
  resources :gyms, only: [:index, :show, :create, :destroy]
  resources :clients, only: [:index, :create, :show]
end

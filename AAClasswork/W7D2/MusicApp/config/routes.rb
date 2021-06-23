Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create, :destroy, :new]
  resources :bands, only: [:index, :create, :new, :edit, :show, :update, :destroy]
end

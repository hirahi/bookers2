Rails.application.routes.draw do
  devise_for :users
  get "/home/about" => "homes#about", as: "about"

  root to: 'homes#top'

  resources :books, only: [ :index, :show, :edit, :create, :update, :destroy]
  resources :users, only: [ :index, :show, :edit, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

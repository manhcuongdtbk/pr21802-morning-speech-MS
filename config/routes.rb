Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  mount Ckeditor::Engine => "/ckeditor"

  root "static_pages#home"
  get "/about", to: "static_pages#about"
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users, only: :show do
    resources :following, only: :index
    resources :followers, only: :index
  end
  resources :themes, only: :index
  resources :speeches, except: :index
  resources :relationships, only: [:create, :destroy]
  get :search, controller: :main
end

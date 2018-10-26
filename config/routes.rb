Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  mount Ckeditor::Engine => "/ckeditor"

  root "static_pages#home"
  devise_for :users
  resources :users, only: :show
  resources :themes, only: :index
  resources :speeches
end

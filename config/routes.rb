Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  root "static_pages#home"
  devise_for :users
  resources :users, only: :show
  resources :themes, only: :index
end

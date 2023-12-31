Rails.application.routes.draw do
  namespace :users_backoffice do
    get 'welcome/index'
  end
  devise_for :users
  devise_for :admins
  root 'home#index'
end

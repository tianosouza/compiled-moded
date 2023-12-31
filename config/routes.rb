Rails.application.routes.draw do

  resources :exams

  namespace :home do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end



  devise_for :users
  devise_for :admins


  root 'home/welcome#index'
end

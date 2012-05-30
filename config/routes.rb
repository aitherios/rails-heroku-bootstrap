StartaeBootstrap::Application.routes.draw do
  devise_for :users

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root  to:                     'home#index'
  match 'frontend/:template' => 'frontend#show'
  match 'frontend'           => 'frontend#index'
end

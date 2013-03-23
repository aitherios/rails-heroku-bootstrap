require 'resque/server'

AitheriosStartaeBootstrap::Application.routes.draw do
  devise_for :users, sign_out_via: :get, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get '/users/connect/:network', to: redirect("/users/auth/%{network}"),
                                   as: 'user_omniauth_connect'
  end

  get '/usuarios/minha-conta' => 'settings#edit', as: :edit_user
  put '/usuarios' => 'settings#update', as: :update_user
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  authenticate :admin_user do
    mount Resque::Server, :at => "/workers"
  end
  
  root  to:                     'home#index'
  get    'contato'           => 'contacts#index', as: :contacts
  match  'contato/enviar'    => 'contacts#new',   as: :new_contact
  match 'frontend/:template' => 'frontend#show'
  match 'frontend'           => 'frontend#index'
  match ':slug'              => 'pages#show',     as: :page
end

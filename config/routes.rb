require 'resque/server'

RailsHerokuBootstrap::Application.routes.draw do
  mount Mercury::Engine => '/'
  mount Ckeditor::Engine => '/ckeditor'
  mount Kss::Engine => '/kss' if Rails.env.development?

  devise_for :admin_users, ActiveAdmin::Devise.config

  authenticate :admin_user do
    mount Resque::Server, :at => '/workers'
  end

  devise_for :users, sign_out_via: :get, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get '/users/connect/:network', to: redirect("/users/auth/%{network}"),
                                   as: 'user_omniauth_connect'
  end

  get '/usuarios/minha-conta' => 'settings#edit', as: :edit_user
  put '/usuarios' => 'settings#update', as: :update_user
  
  root  to:                     'home#index'
  get   'contato'            => 'contacts#index', as: :contacts
  match 'contato/enviar'     => 'contacts#new',   as: :new_contact

  match 'frontend/:template' => 'frontend#show'
  match 'frontend'           => 'frontend#index'
  put   'content_blocks'     => 'content_blocks#update'

  ActiveAdmin.routes(self)
  get ':slug'                => 'pages#show',     as: :page
end

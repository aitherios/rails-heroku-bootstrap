StartaeBootstrap::Application.routes.draw do
  devise_for :users, sign_out_via: :get, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get '/users/connect/:network', to: redirect("/users/auth/%{network}"),
                                   as: 'user_omniauth_connect'
  end

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root  to:                     'home#index'
  match 'frontend/:template' => 'frontend#show'
  match 'frontend'           => 'frontend#index'
  
  match ':slug' => 'paginas#show', as: :pagina
end

OutraCoisa::Application.routes.draw do
  root  to:                     'home#index'
  match 'frontend/:template' => 'frontend#show'
  match 'frontend'           => 'frontend#index'
end

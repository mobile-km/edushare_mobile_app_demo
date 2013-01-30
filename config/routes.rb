EdushareMobileDemo::Application.routes.draw do
  root :to => 'index#index'

  resources :a1
  resources :d1
  resources :e1
end

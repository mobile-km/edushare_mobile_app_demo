EdushareMobileDemo::Application.routes.draw do
  root :to => 'index#index'

  resources :a1, :a2, :a3
  resources :b1, :b2, :b3
  
  resources :d1
  resources :e1
  resources :e2
  resources :e3
end

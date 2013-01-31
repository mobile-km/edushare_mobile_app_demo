EdushareMobileDemo::Application.routes.draw do
  root :to => 'index#index'

  resources :a1, :a2, :a3
  resources :b1, :b2, :b3
  resources :c1, :c2, :c3
  resources :c41, :c42, :c43
  resources :c51, :c52, :c53
  
  resources :d1
  resources :e1
  resources :e2
  resources :e3
  resources :f1
  resources :g1
  resources :g2
  resources :h1
  resources :h2
  resources :i1
  resources :i2
  resources :i3
  resources :l1
  resources :l2
  resources :l3
end
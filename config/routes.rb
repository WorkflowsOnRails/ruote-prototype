RuotePrototype::Application.routes.draw do

  devise_for :users

  root to: 'issues#index'

  resources :issues

  # routes to RuoteKit
  get '/_ruote' => RuoteKit::Application
  get '/_ruote/*path' => RuoteKit::Application


end

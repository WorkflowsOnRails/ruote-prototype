RuotePrototype::Application.routes.draw do

  devise_for :users


  authenticated :user, lambda { |u| u.role.name == 'developer' } do
    root to: "issues#index", as: 'developer_root'
  end

  authenticated :user, lambda { |u| u.role.name == 'manager' } do
    root to: "issues#index", as: 'project_manager_root'
  end

  authenticated :user, lambda { |u| u.role.name == 'reporter' } do
    root to: "issues#index", as: 'reported_root'
  end

  devise_scope :user do
    root to: "issues#login", as: 'login_root'
  end

  resources :issues

  # routes to RuoteKit
  get '/_ruote' => RuoteKit::Application
  get '/_ruote/*path' => RuoteKit::Application


end

Rails.application.routes.draw do
 # get 'tasks/index'

# get 'tasks/show'

  #get 'courses/index'

  #get 'courses/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #get 'home/index'

  root to: "courses#index"

  resources   :courses do
    resources :tasks, only: [:show]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

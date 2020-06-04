Rails.application.routes.draw do
  namespace :admin do
      resources :livres
      resources :users, except: [:new, :create]

      root to: "livres#index"
    end
  get 'welcome/index'
  
  get 'default/index'
  post 'default/post_superadmin'

  get "/sign_up" => "users#new", as: "custom_sign_up"
  post "/users" => "users#create", as: "custom_users_path"

  root 'welcome#index'

end

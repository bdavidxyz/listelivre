Rails.application.routes.draw do
  namespace :admin do
      resources :livres
      resources :users

      root to: "livres#index"
    end
  get 'welcome/index'
  
  get 'default/index'
  post 'default/post_superadmin'

  get "/sign_up" => "users#new", as: "custom_sign_up"

  root 'welcome#index'

end

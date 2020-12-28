Rails.application.routes.draw do

  namespace :admin do
    resources :livres
    resources :users, except: [:new, :create]

    root to: "livres#index"
  end

  get 'welcome/index'

  get '/conditions' => 'pages#conditions'

  get 'default/index'
  post 'default/post_superadmin'


  post "/users" => "users#create", as: "custom_users_path"
  get "/sign_up" => "users#new", as: "custom_sign_up"

  delete '/sign_out' => 'sessions#destroy', as: "custom_sign_out"

  root 'welcome#index'

end

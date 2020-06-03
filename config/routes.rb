Rails.application.routes.draw do
  namespace :admin do
      resources :livres

      root to: "livres#index"
    end
  get 'welcome/index'
 
  root 'welcome#index'
end

Rails.application.routes.draw do
  devise_for :users
  get 'web_app/index'

  resources :articles do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'web_app#index'
end

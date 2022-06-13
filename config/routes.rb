Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  
  resources :sharks do
    resources :posts
  end

  
  root 'sharks#index'
end

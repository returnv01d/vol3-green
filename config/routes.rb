Rails.application.routes.draw do
  devise_for :users
  resources :caterings
  root to: "caterings#index"
end

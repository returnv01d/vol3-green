Rails.application.routes.draw do
  resources :ingredients
  devise_for :caterings
  devise_for :users
  
  resources :caterings do
    resources :meals, only: [:index, :show, :edit]
  end
  root to: "welcome#index"
end

Rails.application.routes.draw do
  get 'ingredients/new'
  get 'ingredients/index'
  get 'ingredients/show'
  get 'ingredients/update'
  get 'ingredients/edit'
  get 'ingredients/create'
  devise_for :caterings
  devise_for :users
  
  resources :caterings do
    resources :meals, only: [:index, :show, :edit]
  end
  root to: "caterings#index"
end

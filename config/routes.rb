Rails.application.routes.draw do
  devise_for :users
  resources :caterings do
    resources :meals, only: [:index, :show, :edit]
  end
  root to: "caterings#index"

end

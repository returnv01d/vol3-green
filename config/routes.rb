Rails.application.routes.draw do
  get 'create_allergic_prefs/edit_allergic_prefs'
  get 'create_allergic_prefs/delete_allergic_prefs'
  resources :ingredients
  devise_for :caterings
  devise_for :users
  
  resources :caterings, only: [:index, :show] do
    resources :meals, only: [:index, :show, :edit, :new, :create]
  end
  root to: "welcome#index"
end

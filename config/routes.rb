Rails.application.routes.draw do
  get 'users/new_allergic_prefs'
  get 'users/create_allergic_prefs'
  post 'users/create_allergic_prefs'
  get 'users/edit_allergic_prefs'
  get 'users/delete_allergic_prefs'
  delete 'users/delete_allergic_prefs'
  resources :ingredients
  devise_for :caterings
  devise_for :users

  resources :caterings, only: [:index, :show] do
    resources :meals, only: [:index, :show, :edit, :new, :create]
    resources :daily_meals, only: [:index, :new, :create]
  end
  root to: "welcome#index"
end

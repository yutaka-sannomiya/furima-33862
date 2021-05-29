Rails.application.routes.draw do
  
  devise_for :users

  root to: 'items#index'

  resources :items, :index, :new, :create, :show, :edit, :update, :destroy do
  end
end

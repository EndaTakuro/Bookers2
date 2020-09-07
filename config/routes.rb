Rails.application.routes.draw do
  root 'home#index'
  get 'home/about' => 'home#about'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:index, :edit, :create, :show, :update]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
end

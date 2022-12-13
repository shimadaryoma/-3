Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'home/about'
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:new, :index, :show, :edit, :create, :destroy, :update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

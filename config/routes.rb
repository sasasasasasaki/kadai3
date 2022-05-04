Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  #get 'homes/new'
  #get 'homes/index'
  #get 'homes/show'
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  resources :users, only: [:index,:show,:edit,:create,:destroy,:update]

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]


  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end

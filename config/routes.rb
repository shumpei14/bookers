Rails.application.routes.draw do


  get 'home/about' => 'homes#about'
  get 'top/index'
  devise_for :users

    root 'top#index'
resources :books
resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

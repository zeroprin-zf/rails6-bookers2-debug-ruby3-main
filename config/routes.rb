Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  get "search" => "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy] #resourceはURLを含ませないため
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    member do
      get :follows, :followers
    end
      resource :relationships, only: [:create, :destroy]
    end
  root to: "homes#top"
  get "home/about"=>"homes#about"
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


Rails.application.routes.draw do
  get 'blogs/index'
  resources :schedules
  resources :events
  resources :meetings

  root 'top#index'
  get 'seminars/index' => 'seminar/index'
  devise_for :users
  resources :users, only: [:show]
  
  get 'top/index' => 'top#index'
 
  get 'user/show' => 'user#show'
  get 'user/index' => 'user#index'
  get 'events/index' => 'events#index'
  get 'blogs/index' => 'blogs#index'
  get 'schedules/index' => 'schedules#index'
  get 'blogs/search' => 'blogs#search'
  get 'blogs/new' => 'blogs#new'
  get 'top/show' =>'top#show'
  post 'blogs' => 'blogs#create'
  get 'blogs/test' => 'blogs#test'
  get 'blogs/edit' => 'blogs#edit'
  get 'blogs/show' => 'blogs#show'
   
  resources :blogs do
  resources :likes, only: [:create, :destroy]
  end

  resources :schedules


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'blogs/index'
  resources :schedules
  resources :events
  resources :meetings

  root 'top#index'
  get 'seminars/index' => 'seminar/index'
  devise_for :users
  
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

   
  resources :blogs
  resources :schedules


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

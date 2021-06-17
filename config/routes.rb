Rails.application.routes.draw do
  resources :meetings
  get 'blogs/index'
  root 'top#index'
  get 'seminars/index' => 'seminar/index'
  devise_for :users
  resources :users, only: [:show] 
  get 'top/index' => 'top#index'
  get 'completes/new' => 'completes#new'
  get 'completes/index' => 'completes#index'
  post 'completes' => 'completes#create' 
  get 'completes/show' => 'completes#show'
  post 'completes' => 'completes#new'
  get 'completes/:id' => 'completes#index',as: 'complete'
  post 'completes/update' => 'completes#update'
  get 'completes/destroy' => 'completes#destroy'
  patch 'completes/:id' => 'completes#update'
  delete 'completes/:id' => 'completes#destroy' 
  get 'completes/:id/edit' => 'completes#edit', as:'edit_complete'
  get 'user/show' => 'user#show'
  get 'user/index' => 'user#index'
  get 'events/index' => 'events#index'
  get 'blogs/index' => 'blogs#index'
   
  resources :blogs

  resources :completes do
    get :show, on: :collection
  end  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

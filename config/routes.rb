Rails.application.routes.draw do
  get 'top/index' => 'top#index'
  get 'complete/new' => 'complete#new'
  post 'complete/create' => 'complete#create'
  get 'complete/show' => 'complete#show'
  post 'complete/update' => 'complete#update'
  get 'complete/destroy' => 'complete#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

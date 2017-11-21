Rails.application.routes.draw do
  get 'materials/index'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # As buyer
  resources :materials, only: [:index]

  #As Seller
  resources :materials, only: [:index]

end

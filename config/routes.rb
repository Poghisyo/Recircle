Rails.application.routes.draw do



  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: "users/omniauth_callbacks"  }

  root to: 'pages#home'

  resource :profile, except: [:new, :create, :destroy]# only: [:new, :create, :edit, :update]
  resource :dashboard, only: [:show] do
    resources :chats, except: [:new] do
      resources :messages, only: [:create, :new, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #As Seller

  resources :materials, only: [:index, :show, :new, :create, :destroy]

  #As Buyer
  resources :purchases, only: [:index, :new, :create, :destroy]

  resources :favourites, only: [:new, :create, :index]
end

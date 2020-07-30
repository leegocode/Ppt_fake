Rails.application.routes.draw do



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'pages/index'
  root 'pages#index'  #

  get '/about', to: "pages#about"
  # root 'pages#about'

  # get "/hello.php", to: "pages#php"

  resources :boards do
    # resources :posts, only: [:index, :new, :create]
    resources :posts, shallow:true

  end#path:

  # resources :posts, except: [:index, :new, :create]

end

Rails.application.routes.draw do



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'pages/index'
  # root 'boards#index'  #
  root 'pages#index'


  # get "/hello.php", to: "pages#php"

  resources :boards do
    # resources :posts, only: [:index, :new, :create]
    resources :posts, shallow:true
  end

  # , param: :permalink



  resources :users, only: [:create] do
    # member do 會有id
    #   get :profile
    # end
    collection do
      get :sign_up
      get :edit
      patch :update
      get :sign_in
      post :login
      delete :sign_out
    end
  end

  #path:



  # resources :posts, except: [:index, :new, :create]

end

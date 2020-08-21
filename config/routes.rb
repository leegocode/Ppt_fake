Rails.application.routes.draw do



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'pages/index'
  root "pages#index"
   get "/about", to: "pages#about"
   get "/pricing", to: "pages#pricing"
   get "/payment", to: "pages#payment"
   post "/checkout", to: "pages#checkout"
  # root 'pages#index'


  namespace :api do
    namespace :v2 do
      resources :boards, only: [:index]
    end
  end


  resources :favorites, only: [:index]

  # get "/hello.php", to: "pages#php"

  resources :boards do
    # resources :posts, only: [:index, :new, :create]
    member do
      post :favorite
      put :hide
    end

    member do
      put :hide
    end

    resources :posts, shallow: true do
     resources :comments, shallow: true, only: [:create]
   end
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

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # resources :posts, except: [:index, :new, :create]

end

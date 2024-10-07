Rails.application.routes.draw do
  get 'public/index'

  get 'public/show'

  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'
  
  # resources :subjects do 
  #   member do 
  #     get :delete 
  #   end
  # end

  # resources :pages do
  #   member do 
  #     get :delete
  #   end 
  # end

  root "public#index"
  get "show/:permalink", to: "public#show"
  get "admin", :to => "access#index"

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end


  match ':controller(/:action(/:id))', :via => [:get, :post]

  # get 'demo/index'

  # get 'demo/index'
  # get 'demo/hello'
  # get 'demo/redirect_page'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

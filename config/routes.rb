Rails.application.routes.draw do

  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'
  # resources :subjects

  match ':controller(/:action(/:id))', :via => [:get, :post]
  
  # get 'demo/index'

  get 'demo/index'
  get 'demo/hello'
  get 'demo/redirect_page'
  root "demo#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

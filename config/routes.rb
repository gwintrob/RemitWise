Remitwise::Application.routes.draw do

  get "users/show"

  get "invitations/accept"

  get "invitations/ignore"

  devise_for :users

  root :to => 'home#index'
  
  resources :remittances
  resources :connections

  resources :users, :only => [:show]

  resources :invitations, :only => [:index, :destroy] do
    member do
      get :accept
    end
  end

end

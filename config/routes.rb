Rails.application.routes.draw do
  root to: "main#show"
  get 'help', to: 'help#help'
  get 'upload', to: 'upload#upload'
  get 'users', to: 'users#users'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end
  resources :upload do
    collection do
      post :import
    end
  end

  resources :users, except: [:show]
  get '/users/index', to: 'users#index', as: 'users_index'
end

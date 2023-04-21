Rails.application.routes.draw do
  root to: "main#show"
  get 'help', to: 'help#help'
  get 'upload', to: 'upload#upload'
  get 'users', to: 'users#users'
  get 'districts', to: 'districts#districts'
  get 'campuses', to: 'districts#districts'
  get 'campuses/:id/edit_campus', to: 'campuses#edit_campus'
  get 'data_imports', to: 'data_imports#data_imports'
  get 'data_imports/index', to: 'data_imports#index'
  get 'data_imports/current_user', to: 'data_imports#current_user'
  get 'data_imports/:id/download_csv', to: 'data_imports#download_csv', as: 'download_csv'
  get 'data_imports/:id/download_image', to: 'data_imports#download_image', as: 'download_image'
  get 'data_imports/download_all', to: 'data_imports#download_all', as: 'download_all'

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

  resources :data_imports do
    collection do
      post :import
    end
  end

  resources :users, except: [:show]
  get '/users/index', to: 'users#index', as: 'users_index'

  resources :districts, except: [:show]
  get '/districts/index', to: 'districts#index', as: 'districts_index'
  get '/districts/find_by/:id', to: 'districts#find_by'

  resources :campuses, except: [:show]
  get '/campuses/index', to: 'campuses#index', as: 'campuses_index'
end

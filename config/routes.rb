Rails.application.routes.draw do
  root to: "main#show"
  get 'help', to: 'help#help'
  get 'upload', to: 'upload#upload'
  get 'account', to: 'account#account'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end
end

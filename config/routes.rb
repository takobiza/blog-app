Rails.application.routes.draw do
  devise_for :users, skip: [:sessions], :controllers => {
    :registrations => 'users/registrations',
    :omniauth_callbacks => 'users/omniauth_callbacks'
  }
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'users/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
    post 'users/sign_up/confirm' => 'users/registrations#confirm'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'
  resources :blogs
end

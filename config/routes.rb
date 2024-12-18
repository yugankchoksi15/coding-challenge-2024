Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "orders#index"

  resources :orders do
    resources :messages, only: [:create]
  end
end


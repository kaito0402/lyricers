Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "tweets#index"
  resources :tweets, only: [:index, :new, :create, :destroy, :show] do
    resources :comments, only: :create
  end
end

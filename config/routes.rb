Rails.application.routes.draw do
  get 'tweets/index'
  resources :tweets, only: :index
end

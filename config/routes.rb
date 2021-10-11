Rails.application.routes.draw do
  root 'pictures#index'
  resources :pictures
  resources :favorites, only: [:create, :destroy]
  devise_for :users
  resources :users, only: :show
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

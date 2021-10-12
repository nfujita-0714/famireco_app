Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'tops#index'
  resources :pictures
  resources :favorites, only: [:create, :destroy, :index]
  devise_for :users
  resources :users, only: :show

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

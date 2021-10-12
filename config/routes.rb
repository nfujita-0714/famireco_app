Rails.application.routes.draw do
  root 'tops#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :pictures do
    collection do
      get 'search'
    end
  end
  
  resources :favorites, only: [:create, :destroy, :index]
  devise_for :users
  resources :users, only: :show

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

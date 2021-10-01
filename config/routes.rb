Rails.application.routes.draw do
  root 'home#index'
  devise_for :user, skip: :all
  devise_for :users
  devise_for :unconfirmed_users, class_name: 'UnconfirmedUser', controllers: {
    confirmations: 'user/confirmations',
  }
  resources :users, only: [:create]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, class_name: 'UnconfirmedUser', controllers: {
    confirmations: 'user/confirmations'
  }
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

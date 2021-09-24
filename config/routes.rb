Rails.application.routes.draw do
  root 'home#index'
  devise_for :unconfirmed_users, class_name: 'UnconfirmedUser', controllers: {
    confirmations: 'user/confirmations',
  }
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

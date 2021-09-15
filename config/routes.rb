Rails.application.routes.draw do
  root 'home#index'
  devise_for :accounts, controllers: {
    sessions: 'accounts/sessions'
  }
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

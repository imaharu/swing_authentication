class UsersController < ApplicationController
  include Devise::Controllers::Helpers
  def create
    unconfirmed_user = UnconfirmedUser.find_by!(confirmation_token: params[:confirmation_token])
    user = User.new(nickname: params[:nickname])
    password_authentication = PasswordAuthentication.new(
      user: user, email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]
    )
    ActiveRecord::Base.transaction do
      user.save!
      password_authentication.save!
      unconfirmed_user.destroy!
    end
    sign_in(:user, user)
    sign_in(database_authentication: password_authentication)
    redirect_to root_path
  end
end

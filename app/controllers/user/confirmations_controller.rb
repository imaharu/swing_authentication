# frozen_string_literal: true

class User::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  def create
    unconfirmed_user = UnconfirmedUser.find_or_initialize_by(unconfirmed_email: params[:unconfirmed_user][:email])
    unconfirmed_user.save
    super do
      redirect_to root_path and return
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    super do
      return render "users/confirmations/show"
    end
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end

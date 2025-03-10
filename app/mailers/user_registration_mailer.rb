class UserRegistrationMailer < ApplicationMailer
  before_action do
    @user_registration = params[:user_registration]
  end

  def requested
    @url = new_user_registration_confirmation_url(@user_registration, token: @user_registration.token)
    mail to: @user_registration.email
  end
end

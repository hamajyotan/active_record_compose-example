class UserRegistrationMailer < ApplicationMailer
  before_action do
    @user_registration = params[:user_registration]
  end

  def requested
    @url = 'https://example.com/' # TODO: fix link
    mail to: @user_registration.email
  end
end

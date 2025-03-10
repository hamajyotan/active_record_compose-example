class UserRegistrations::ApplicationController < ApplicationController
  before_action :set_user_registration

  private

  def set_user_registration
    @user_registration = UserRegistration.active.find(params.expect(:user_registration_id))
  end
end

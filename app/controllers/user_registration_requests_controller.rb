class UserRegistrationRequestsController < ApplicationController
  before_action :set_new_user_registration_request, only: %i[new create]

  def new; end

  def create
    if @user_registration_request.update(user_registration_request_params)
      redirect_to root_path, notice: t(".created"), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_new_user_registration_request
    @user_registration_request = UserRegistrationRequest.new
  end

  def user_registration_request_params
    params.expect(user_registration_request: %i[email])
  end
end

class Dashboard::PasswordsController < Dashboard::ApplicationController
  before_action :set_dashboard_password, only: %i[show update]

  def show; end

  def update
    if @dashboard_password.update(dashboard_password_params)
      # A password change refreshes the UserCredential token.
      # This will destroy the login state, but only the currently operating session will remain logged in.
      sign_in(current_user.user_credential)
      redirect_to dashboard_password_path, notice: t(".updated"), status: :see_other
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_dashboard_password
    @dashboard_password = Dashboard::Password.new(current_user)
  end

  def dashboard_password_params
    params.expect(dashboard_password: %i[password password_confirmation])
  end
end

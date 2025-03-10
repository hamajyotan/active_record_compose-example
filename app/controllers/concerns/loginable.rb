module Loginable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :logged_in?
  end

  private

  def require_login
    return if logged_in?

    redirect_to new_session_path, alert: t("please_log_in_first"), status: :see_other
  end

  def logged_in? = current_user.present?

  def current_user
    @current_user ||= begin
      (session[:user_credential_id] && UserCredential.find_by(id: session[:user_credential_id], token: session[:user_credential_token])&.user)
    end
  end

  def sign_in(user_credential)
    session[:user_credential_id] = user_credential.id
    session[:user_credential_token] = user_credential.token
  end

  def sign_out
    session.delete(:user_credential_id)
    session.delete(:user_credential_token)
  end
end

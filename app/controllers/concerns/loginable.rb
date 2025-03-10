module Loginable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :logged_in?
  end

  private

  def logged_in? = current_user.present?

  def current_user = nil # TODO: need to implement it

  def sign_in(user_credential) = nil # TODO: need to implement it
end

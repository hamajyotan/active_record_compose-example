class SessionsController < ApplicationController
  before_action :require_login, only: %i[destroy]
  before_action :set_new_session, only: %i[new create]

  def new
  end

  def create
    if @session.update(session_params)
      sign_in(@session.authorized_user_credential)
      redirect_to root_path, notice: t(".created"), status: :see_other
    else
      sign_out
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: t(".destroyed"), status: :see_other
  end

  private

  def set_new_session
    @session = Session.new
  end

  def session_params
    params.expect(session: %i[email password])
  end
end

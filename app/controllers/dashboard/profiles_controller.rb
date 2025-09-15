class Dashboard::ProfilesController < Dashboard::ApplicationController
  before_action :set_dashboard_profile, only: %i[show update]

  def show; end

  def update
    if @dashboard_profile.update(dashboard_profile_params)
      I18n.with_locale(current_user.lang) do
        redirect_to dashboard_profile_path, notice: t(".updated"), status: :see_other
      end
    else
      render :show, status: :unprocessable_content
    end
  end

  private

  def set_dashboard_profile
    @dashboard_profile = Dashboard::Profile.new(current_user)
  end

  def dashboard_profile_params
    params.expect(dashboard_profile: %i[name lang])
  end
end

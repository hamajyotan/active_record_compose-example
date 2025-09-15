class Dashboard::ResignationsController < Dashboard::ApplicationController
  before_action :set_dashboard_resignation, only: %i[new create]

  def new; end

  def create
    if @dashboard_resignation.update(dashboard_resignation_params)
      sign_out
      redirect_to root_path, notice: t(".created"), status: :see_other
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def set_dashboard_resignation
    @dashboard_resignation = Dashboard::Resignation.new(current_user)
  end

  def dashboard_resignation_params
    params.expect(dashboard_resignation: %i[accept reason])
  end
end

class Dashboard::ApplicationController < ApplicationController
  before_action :require_login
end

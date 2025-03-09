class ApplicationController < ActionController::Base
  default_form_builder ApplicationFormBuilder

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end

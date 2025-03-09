class LocalesController < ApplicationController
  def update
    cookies[:locale] = params[:lang].to_s.to_sym.presence_in(I18n.available_locales) || I18n.default_locale
    redirect_back fallback_location: root_path
  end
end

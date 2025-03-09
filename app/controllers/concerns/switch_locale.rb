module SwitchLocale
  extend ActiveSupport::Concern

  included do
    around_action :switch_locale
  end

  private

  def switch_locale(&action)
    locale = extract_locale || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def extract_locale
    cookies[:locale].to_s.to_sym.presence_in(I18n.available_locales)
  end
end

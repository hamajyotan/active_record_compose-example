class User < ApplicationRecord
  has_one :user_credential
  has_one :user_profile
  has_one :user_registration
  has_one :user_resignation
  has_many :posts

  delegate :lang, to: :user_profile, allow_nil: true

  def name = user_profile&.name || I18n.t("resigned_user")
end

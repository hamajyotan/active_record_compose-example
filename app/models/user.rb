# This model represents a user in its simplest form.
# It does not have any specific attributes.

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_one :user_credential
  has_one :user_profile
  has_one :user_registration
  has_one :user_resignation
  has_many :posts

  delegate :lang, to: :user_profile, allow_nil: true

  def name = user_profile&.name || I18n.t("resigned_user")
end

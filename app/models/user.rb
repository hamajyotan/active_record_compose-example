class User < ApplicationRecord
  has_one :user_credential
  has_one :user_profile
  has_one :user_registration

  delegate :name, :lang, to: :user_profile, allow_nil: true
end

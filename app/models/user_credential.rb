# This model represents a user's authentication credentials.
# When a user is logged in, the UserCredential data can be retrieved from the HTTP session.
# This data is deleted when the user's account is deactivated.

# == Schema Information
#
# Table name: user_credentials
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  token           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer          not null
#
class UserCredential < ApplicationRecord
  has_secure_password

  normalizes :email, with: ->(email) { email.strip.downcase }

  belongs_to :user
  validates :email, :password, presence: true
  validates :email, uniqueness: true

  before_validation :set_token

  def refresh_token
    self.token = nil
    set_token
  end

  private

  def set_token
    self.token ||= SecureRandom.hex
  end
end

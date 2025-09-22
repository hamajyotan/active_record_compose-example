# This represents a user signup request event.
# The only time an existing UserRegistration record is updated is when the user actually registers.
# At that point, the `user_id` field (which is nullable) will be populated with the ID of the newly registered user.

# == Schema Information
#
# Table name: user_registrations
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  expires_at :datetime         not null
#  token      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class UserRegistration < ApplicationRecord
  attribute :expires_at, default: -> { 3.hours.after }
  normalizes :email, with: ->(email) { email.strip.downcase }

  validates :email, :token, :expires_at, presence: true
  validates :token, uniqueness: true

  before_validation :set_token

  belongs_to :user, optional: true

  scope :active, -> { where(expires_at: Time.current..) }

  private

  def set_token
    self.token ||= loop.lazy.map { SecureRandom.hex }.find { !self.class.exists?(token: it) }
  end
end

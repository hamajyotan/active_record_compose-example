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
    self.token ||= loop.lazy.map { SecureRandom.hex }.find { !self.class.exists?(token: _1) }
  end
end

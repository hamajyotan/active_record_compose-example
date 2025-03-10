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

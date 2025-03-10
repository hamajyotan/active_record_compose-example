class Session < ActiveRecordCompose::Model
  attribute :email, :string
  attribute :password, :string

  validates :email, :password, presence: true
  validate :require_authenticated

  before_validation :normalize
  before_validation :authenticate

  attr_reader :authorized_user_credential

  private

  def normalize
    self.email = email&.downcase
  end

  def authenticate
    @authorized_user_credential = email.present? && password.present? && UserCredential.find_by(email:)&.authenticate(password).presence
  end

  def require_authenticated
    return if authorized_user_credential.present?

    errors.add(:base, :login_failed)
  end
end

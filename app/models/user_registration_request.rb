class UserRegistrationRequest < ActiveRecordCompose::Model
  def initialize
    @user_registration = UserRegistration.new
    models << user_registration
    super
  end

  delegate :persisted?, to: :user_registration

  delegate_attribute :email, to: :user_registration

  after_commit :send_email_notification

  validate :unique_email

  private

  attr_reader :user_registration

  def send_email_notification
    UserRegistrationMailer.with(user_registration:).requested.deliver_later
  end

  def unique_email
    return unless UserCredential.exists?(email:)

    errors.add(:email, :taken)
  end
end

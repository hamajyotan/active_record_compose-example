class UserRegistrations::Confirmation < ActiveRecordCompose::Model
  def initialize(user_registration)
    @user_registration = user_registration
    @user = User.new.tap do |u|
      u.build_user_credential
      u.build_user_profile
    end
    models << user_registration << user << user_credential << user_profile
    super()
  end

  before_validation :associate_user
  after_commit :set_registered_user_credential

  delegate_attribute :password, :password_confirmation, to: :user_credential
  delegate_attribute :name, :lang, to: :user_profile

  attr_reader :registered_user_credential

  private

  attr_reader :user, :user_registration

  delegate :user_credential, :user_profile, to: :user, private: true

  def associate_user
    user_registration.user = user
    user_credential.email = user_registration.email
  end

  def set_registered_user_credential
    @registered_user_credential = user_credential
  end
end

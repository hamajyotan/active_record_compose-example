class UserRegistrationRequest < ActiveRecordCompose::Model
  def initialize
    @user_registration = UserRegistration.new
    models << user_registration
    super
  end

  delegate :persisted?, to: :user_registration

  delegate_attribute :email, to: :user_registration

  private

  attr_reader :user_registration
end

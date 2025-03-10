class Dashboard::Password < ActiveRecordCompose::Model
  def initialize(user)
    @user = user
    super()
    models << user_credential
  end

  delegate_attribute :password, :password_confirmation, to: :user_credential

  def persisted? = true

  before_validation :refresh_token

  private

  attr_reader :user

  delegate :user_credential, to: :user, private: true
  delegate :refresh_token, to: :user_credential, private: true
end

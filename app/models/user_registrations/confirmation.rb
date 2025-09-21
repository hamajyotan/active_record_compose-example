# This resource is handled by the controller responsible for user registration.
# Within the context of user registration,
# it performs a series of actions such as registering user profiles and credentials,
# and establishing the relationship between the UserRegistration and User models.
#
# Although it involves updating data across several ActiveRecord models,
# from the controller's perspective, it is considered a single operation on a unified resource.
#
# +==================================================+
# |                                                  |
# | UserRegistrations::Confirmation                  |
# |                                                  |
# | +---------------------+                          |
# | | UserRegistration    |                          |
# | +---------------------+                          |
# | +---------------------+                          |
# | | User                |                          |
# | +---------------------+                          |
# | +---------------------+                          |
# | | UserCredential      |                          |
# | |                 --------                   --------
# | |                 password ----------------- password
# | |                 --------                   --------
# | |                     |                          |
# | |           ---------------------      ---------------------
# | |           password_confirmation ---- password_confirmation
# | |           ---------------------      ---------------------
# | +---------------------+                          |
# | +---------------------+                          |
# | | UserProfile         |                          |
# | |                  ------                     ------
# | |                   name  -------------------  name
# | |                  ------                     ------
# | |                     |                          |
# | |                  ------                     ------
# | |                   lang  -------------------  lang
# | |                  ------                     ------
# | +---------------------+                          |
# |                                                  |
# +==================================================+
#
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

  # If user registration is successful,
  # the controller will automatically log the user in immediately afterward.
  # This reader is used to provide the necessary credentials to the controller for this process.
  #
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

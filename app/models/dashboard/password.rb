# This is a model that is used by the controller responsible for password changes.
# It includes a before_validation hook specifically designed for this context.
#
# +==============================================+
# |                                              |
# | Dashboard::Password                          |
# |                                              |
# | +-------------------+                        |
# | |                   |                        |
# | | UserCredential    |                        |
# | |               --------                 --------
# | |               password --------------- password
# | |               --------                 --------
# | |                   |                        |
# | |         ---------------------      ---------------------
# | |         password_confirmation ---- password_confirmation
# | |         ---------------------      ---------------------
# | |                   |                        |
# | +-------------------+                        |
# |                                              |
# +==============================================+
#
class Dashboard::Password < ActiveRecordCompose::Model
  def initialize(user)
    @user = user
    super()
    models << user_credential
  end

  delegate_attribute :password, :password_confirmation, to: :user_credential

  def persisted? = true

  # If you update the UserCredential directly from the controller,
  # you would need to implement this hook within the UserCredential class.
  # However, this would require adding conditional logic, such as checking if the password has changed.
  #
  # Alternatively, even without using a hook, the controller would need to be aware of the refresh token handling process.
  #
  before_validation :refresh_token

  private

  attr_reader :user

  delegate :user_credential, to: :user, private: true
  delegate :refresh_token, to: :user_credential, private: true
end

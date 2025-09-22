# This controller and its corresponding resource are designed for updating profile information.
# While there isn't a compelling reason at this point to avoid directly updating the UserProfile object,
# one advantage of this approach is that limiting
# the attributes that can be modified (using `delegate_attribute`)
# improves the readability and maintainability of the controller and views.
#
# +==================================================+
# |                                                  |
# | UserRegistrations::Profile                       |
# |                                                  |
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
class Dashboard::Profile < ActiveRecordCompose::Model
  def initialize(user)
    @user = user
    super()
    models << user_profile
  end

  delegate_attribute :name, :lang, to: :user_profile

  def persisted? = true

  private

  attr_reader :user

  delegate :user_profile, to: :user, private: true
end

# This resource handles the use case of user account deletion.
# It performs a batch deletion of information specific to active users,
# such as UserProfile and UserCredential data,
# while also creating an entry in the UserResignation event model.
#
# Deleting the UserProfile will mark the user as "Resigned" for any existing posts.
# Deleting the UserCredential will invalidate all sessions associated with that user.
#
# +=================================================+
# |                                                 |
# | UserRegistrations::Resignation               --------
# |                                               accept
# |                                              --------
# |                                                 |
# | +==========================+                    |
# | | UserResignation          |                    |
# | |                      --------              --------
# | |                       reason  <---------->  reason
# | |                      --------              --------
# | +==========================+                    |
# | +==========================+                    |
# | | UserProfile (destroy)    |                    |
# | +==========================+                    |
# | +==========================+                    |
# | | UserCredential (destroy) |                    |
# | +==========================+                    |
# |                                                 |
# +=================================================+
#
class Dashboard::Resignation < ActiveRecordCompose::Model
  def initialize(user)
    @user = user
    @user_resignation = user.then { it.user_resignation || it.build_user_resignation }
    models.push(user_resignation)

    # Note the `destroy: true` setting.
    # If the data is valid, a delete operation will be performed on this model during the save process.
    models.push(user_profile, destroy: true)
    models.push(user_credential, destroy: true)

    super()
  end

  attribute :accept, :boolean, default: false
  delegate_attribute :reason, to: :user_resignation

  validates :accept, presence: true

  private

  attr_reader :user, :user_resignation

  delegate :user_profile, :user_credential, to: :user, private: true
end

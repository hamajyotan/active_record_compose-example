class Dashboard::Resignation < ActiveRecordCompose::Model
  def initialize(user)
    @user = user
    @user_resignation = user.then { _1.user_resignation || _1.build_user_resignation }
    models.push(user_resignation)
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

# This model represents a user's profile.
# It contains information about the user's attributes, such as their name.
# This data will be deleted when the user's account is deactivated.

# == Schema Information
#
# Table name: user_profiles
#
#  id         :integer          not null, primary key
#  lang       :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
class UserProfile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :lang, presence: true, inclusion: { in: I18n.available_locales.map { it.to_s } }
end

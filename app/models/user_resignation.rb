# This is an event model that represents a user account resignation.

# == Schema Information
#
# Table name: user_resignations
#
#  id         :integer          not null, primary key
#  reason     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
class UserResignation < ApplicationRecord
  belongs_to :user
end

class UserProfile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :lang, presence: true, inclusion: { in: I18n.available_locales.map { _1.to_s } }
end

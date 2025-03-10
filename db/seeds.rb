# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.development?
  unless User.exists?
    user = User.create!
    user.create_user_credential!(email: 'example@example.com', password: 'P@ssW0rd', password_confirmation: 'P@ssW0rd')
    user.create_user_profile!(name: 'First example user', lang: I18n.default_locale)

    user.posts.create!(content: 'Hello!')
    user.posts.create!(content: 'World!')
    user.posts.create!(content: 'foo!')
    user.posts.create!(content: 'bar!!')
    user.posts.create!(content: 'baz!!!')
    user.posts.create!(content: 'awesome!!!!')
  end
end

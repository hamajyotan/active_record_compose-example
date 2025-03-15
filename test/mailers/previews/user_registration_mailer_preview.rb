# Preview all emails at http://localhost:3000/rails/mailers/user_registration_mailer
class UserRegistrationMailerPreview < ActionMailer::Preview
  def requested
    user_registration = UserRegistration.new(id: -1, email: "test@example.com")
    UserRegistrationMailer.with(user_registration:).requested
  end
end

require "test_helper"

class UserRegistrationMailerTest < ActionMailer::TestCase
  include Rails.application.routes.url_helpers

  test "requested" do
    user_registration = user_registrations(:one)
    mail = UserRegistrationMailer.with(user_registration:).requested
    expected_url = new_user_registration_confirmation_url(user_registration, token: user_registration.token)

    assert_equal "User registration has not yet been completed.", mail.subject
    assert_equal [ user_registration.email ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match expected_url, mail.body.encoded
  end

  private

  def default_url_options = Rails.configuration.action_mailer.default_url_options
end

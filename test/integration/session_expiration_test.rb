require "test_helper"

class SessionExpirationTest < ActionDispatch::IntegrationTest
  test "password change invalidates other sessions" do
    main_session = open_session
    login(main_session)
    assert currently_logged_in?(main_session)

    other_session = open_session
    login(other_session)
    assert currently_logged_in?(other_session)

    change_password(main_session)
    assert currently_logged_in?(main_session)

    assert_not currently_logged_in?(other_session)
  end

  private

  def login(session)
    session.post session_path, params: { session: { email: "one@example.com", password: "P@ssW0rd" } }
    assert_equal session.response.code.to_i, 303
  end

  def currently_logged_in?(session)
    session.get root_path
    assert_equal session.response.code.to_i, 200
    session.response.parsed_body.at_css('.nav-item:contains("Profile")')
  end

  def change_password(session)
    session.patch dashboard_password_path, params: { dashboard_password: { password: "NewP@ssW0rd", password_confirmation: "NewP@ssW0rd" } }
    assert_equal session.response.code.to_i, 303
  end
end

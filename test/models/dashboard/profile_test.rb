require "test_helper"

class Dashboard::ProfileTest < ActiveSupport::TestCase
  test "#save to change the user's password." do
    user = users(:one)

    dashboard_profile = Dashboard::Profile.new(user)
    assert dashboard_profile.update(name: "Dave", lang: "ja")
    assert_equal "Dave", user.user_profile.name
    assert_equal "ja", user.user_profile.lang
  end
end

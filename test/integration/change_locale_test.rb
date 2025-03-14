require "test_helper"

class ChangeLocaleTest < ActionDispatch::IntegrationTest
  test "change locales" do
    get root_path
    assert_response :success
    assert_select ".nav-item", text: "Home"
    assert_select ".nav-item", text: "ホーム", count: 0

    patch locale_path, params: { lang: "ja" }
    assert_redirected_to root_path

    follow_redirect!
    assert_select ".nav-item", text: "Home", count: 0
    assert_select ".nav-item", text: "ホーム"
  end
end

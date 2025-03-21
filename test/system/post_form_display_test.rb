require "application_system_test_case"

class PostFormDisplayTest < ApplicationSystemTestCase
  test "The form to post should appear only if you are logged in" do
    visit root_path
    assert_text "ActiveRecordCompose Example"
    assert_no_text "What is happening?!"

    click_link "Login"
    assert_text "Email"
    fill_in "Email", with: "one@example.com"
    fill_in "Password", with: "P@ssW0rd"
    click_button "Login"
    assert_text "Logged in"

    assert_text "What is happening?!"
  end
end

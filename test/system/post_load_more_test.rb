require "application_system_test_case"

class PostLoadMoreTest < ApplicationSystemTestCase
  test "you can browse the latest posts, and the Load more link allows you to browse past posts" do
    visit root_path
    assert_text "ActiveRecordCompose Example"

    posts = [ posts(:one), posts(:two), posts(:three), posts(:four), posts(:five), posts(:six) ].sort_by { it.id }

    assert_text posts[5].content
    assert_text posts[4].content
    assert_text posts[3].content
    assert_text posts[2].content
    assert_text posts[1].content
    assert_no_text posts[0].content

    click_link "Load more"
    assert_text posts[0].content
  end
end

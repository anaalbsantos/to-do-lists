require "test_helper"

class ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lists_url
    assert_response :success
  end
end

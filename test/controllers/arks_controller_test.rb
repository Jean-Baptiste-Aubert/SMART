require "test_helper"

class ArksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get arks_index_url
    assert_response :success
  end

  test "should get show" do
    get arks_show_url
    assert_response :success
  end
end

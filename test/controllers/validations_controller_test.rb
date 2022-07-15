require "test_helper"

class ValidationsControllerTest < ActionDispatch::IntegrationTest
  test "should exist get validation text" do
    get validations_text_url
    assert_response :success
  end

end

require "test_helper"

class ValidationsControllerTest < ActionDispatch::IntegrationTest
  test "should exist get validation text" do
    get validations_text_url
    assert_response :success
  end
  
  test "should exist get root" do
    get root_url
    assert_response :success
  end

  test "should post validation text" do
    post validate_text_url
    assert_response :success
  end
end

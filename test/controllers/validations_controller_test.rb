require "test_helper"

class ValidationsControllerTest < ActionDispatch::IntegrationTest
  include AssertJson
  test "should exist get validation text" do
    get validations_text_url
    assert_response :success
  end
  
  test "should exist get root" do
    get root_url
    assert_response :success
  end

  test "should post validation text" do
    post "/validations/text", params: { text: 'valid text' }
    
    assert @response.body
  end
  
  test "Validate presence of text" do
    post "/validations/text", params: { }
    
    assert_response :bad_request

    assert_json(@response.body) do
      has :errors do
        has_length_of 1
      end
    end
  end
  
  test "Validate length of text" do
    # to test invalid length
    post "/validations/text", params: { text: 'Inval1d' }
    
    assert_response :bad_request
    response = JSON.parse(@response.body)
    assert_json(@response.body) do
      has :errors do
        has_length_of 1
      end
    end

    assert_equal 'The length of the input must be between 10 and 15 characters', response["errors"][0]
  end
  
  test "Validate presence of digit in text" do
    # to test invalid length
    post "/validations/text", params: { text: 'Invalid Digit' }
    
    assert_response :bad_request
    response = JSON.parse(@response.body)
    assert_json(@response.body) do
      has :errors do
        has_length_of 1
      end
    end

    assert_equal 'The string must include a number.', response["errors"][0]
  end
  
  test "Validate presence of uppercase in text" do
    # to test invalid length
    post "/validations/text", params: { text: '1nvalid digit' }
    
    assert_response :bad_request
    response = JSON.parse(@response.body)
    assert_json(@response.body) do
      has :errors do
        has_length_of 1
      end
    end

    assert_equal 'The string must include an uppercase character.', response["errors"][0]
  end
  
  test "Validate length, number and uppercase" do
    # to test invalid length
    post "/validations/text", params: { text: 'invalid' }
    
    assert_response :bad_request
    response = JSON.parse(@response.body)
    assert_json(@response.body) do
      has :errors do
        has_length_of 3
      end
    end

    errors = [
      'The length of the input must be between 10 and 15 characters',
      'The string must include a number.',
      'The string must include an uppercase character.'
    ]

    assert_equal errors, response["errors"]
  end

  test "Valid length, number and uppercase" do
    # to test invalid length
    post "/validations/text", params: { text: 'This is val1d' }
    
    assert_response :success
    response = JSON.parse(@response.body)
    assert_json(@response.body) do
      has :status
    end

    success = { status: 'ok' }

    assert_equal success[:status], response["status"]
  end
end

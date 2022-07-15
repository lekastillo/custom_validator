require 'test_helper'

# require_relative '../factories/text'
require_relative '../../lib/validators/text_validator'

class ValidationsTest < ActiveSupport::TestCase

    test 'Validate length text between 10 and 15' do
        invalid_length ='invalid'

        text_validator = TextValidator.new(invalid_length)
        
        text_validator.add_validation :valid_length, {min: 10, max: 15}
        assert_equal text_validator.is_valid?, false
        assert_equal ["The length of the input must be between 10 and 15 characters"], text_validator.errors
    end
    
    test 'Validate contain a digit' do
        invalid_length ='invalid'

        text_validator = TextValidator.new(invalid_length)
        
        text_validator.add_validation :contain_digit
        assert_equal text_validator.is_valid?, false
        assert_equal ['The string must include a number.'], text_validator.errors
    end
    
    test 'Validate contain a uppercase' do
        invalid_length ='invalid'

        text_validator = TextValidator.new(invalid_length)
        
        text_validator.add_validation :contain_uppercase
        assert_equal text_validator.is_valid?, false
        assert_equal ['The string must include an uppercase character.'], text_validator.errors
    end
    
    test 'Validate all' do
        invalid_length ='This is valid 1'

        text_validator = TextValidator.new(invalid_length)
        
        text_validator.add_validation :valid_length, {min: 10, max: 15}
        text_validator.add_validation :contain_digit
        text_validator.add_validation :contain_uppercase
        assert_equal text_validator.is_valid?, true
        assert_equal [], text_validator.errors
    end

end

require_relative 'errors/string_input_length_error'
require_relative 'errors/string_input_digit_error'
require_relative 'errors/string_input_uppercase_letter_error'
require_relative 'errors/validation_not_implemented_error'

require_relative 'validations/string_input_length_validator'
require_relative 'validations/string_input_digit_validator'
require_relative 'validations/string_input_uppercase_validator'
# lib/validators/string_validator.rb

# Run Custom Validations on a string
class TextValidator
    # used to save errors list
    attr_accessor :errors

    # we start here with text to be tested
    # initialized all vars

    def initialize(text)
        @text = text
        @validators = Hash.new
        @validator_errors = Hash.new
        @validations = []

        # todo: The load of the customs errors can be improved, maybe something to load dynamically from folder validators
        @validators[:valid_length]= StringInputLengthValidator
        @validators[:contain_digit]= StringInputDigitValidator
        @validators[:contain_uppercase]= StringInputUppercaseValidator
        
        # todo: The load of the customs validators can be improved, maybe something to load dynamically from folder validators
        @validator_errors[:valid_length]= StringInputLengthError
        @validator_errors[:contain_digit]= StringInputDigitError
        @validator_errors[:contain_uppercase]= StringInputUppercaseLetterError

        @errors = []
    end

    # this metthos is important to turn on the validations that must be executed
    # improve: the options params can be used to customize validations
    def add_validation(validation, options = {})
        check_allow_validator(validation)
        @validations << { validation: validation.to_sym, options: options }
    end

    # this method allow execute validations and save it in @errors array
    def validate
        @validations.each do |validation_item|
            validation = validation_item[:validation].to_sym
            validation_opts = validation_item[:options] || {}
            validator_intance = @validators[validation].new(@text, validation_opts)
            @errors << @validator_errors[validation].new(validation_opts).message unless validator_intance.validate
        end
    end

    # this method is other option to validate a text but raise the exception
    # in this method validations are run one by one, not all at the same time
    def validate!
        @validations.each do |validation_item|
            validation = validation_item[:validation].to_sym
            validation_opts = validation_item[:options] || {}
            validator_intance = @validators[validation].new(@text, validation_opts)
            raise @validator_errors[validation].new(validation_opts) unless validator_intance.validate
        end
    end

    # this method run validate method and count errors in @errors var
    # Return true if there is no errors
    # Return false if found errrors  
    def is_valid?
        validate
        @errors.length.zero?
    end

    private
    def check_allow_validator(validation)
        raise ValidationNotImplementedError.new(validation.to_sym) unless @validators.keys.include?(validation.to_sym)
        true
    end
end

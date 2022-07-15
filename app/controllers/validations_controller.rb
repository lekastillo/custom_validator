require_relative '../../lib/validators/text_validator'
class ValidationsController < ApplicationController
  def text
  end

  def validate_text
    errors = []
    errors << {
      text: 'required'
    } if params && params[:text].blank?
    
    if params && params[:text].present?

      text = params[:text]
      text_validator = TextValidator.new(text)

      text_validator.add_validation :valid_length, {min: 10, max: 15}
      text_validator.add_validation :contain_digit
      text_validator.add_validation :contain_uppercase

      unless text_validator.is_valid?
        errors = text_validator.errors
      end
    end

    if errors.size.positive?
      render json: {errors: errors }, status: 400
      return
    end

    render json: { status: 'ok' }
  end
end

require_relative '../../lib/validators/text_validator'
class ValidationsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?

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

    respond_to do |format|
      format.turbo_stream do
        puts errors.inspect
        if errors
          render turbo_stream: turbo_stream.replace(:errors_list, partial: "validations/errors", locals: { errors: errors })
        end
      end

      format.json do
      
        if errors.size.positive?
          render json: {errors: errors }, status: 400
          return
        end

        render json: { status: 'ok' }
      end
    end
  end

  def json_request?
    request.format.json?
  end
end

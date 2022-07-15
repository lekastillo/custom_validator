Rails.application.routes.draw do
  
  root to: 'validations#text'

  get 'validations/text'
  post 'validations/text', to: "validations#validate_text", as: :validate_text

end

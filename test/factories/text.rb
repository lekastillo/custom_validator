# This will guess the User class
FactoryBot.define do
    factory :valid_text do
      text { "Valid Text 1111" }
    end
    
    factory :invalid_length do
      text { "Only n1ne" }
    end
    
    factory :invalid_number do
      text { "Only nine chars" }
    end
    
    factory :invalid_uppercase do
      text { "only n1ne chars" }
    end

    factory :invalid_text do
      text { "only nine" }
    end
    
    # factory :invalid_length_invalid_number do
    #   text { "Only nine" }
    # end

    # factory :invalid_length_invalid_uppercase do
    #     text { "Only n1ne" }
    #   end

    # factory :invalid_length_invalid_number_invalid_uppercase do
    #     text { "only nine" }
    # end
end
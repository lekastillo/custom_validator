class StringInputUppercaseLetterError < StandardError
    
    def initialize(options)
    end
    def message
        'The string must include an uppercase character.'
    end
end
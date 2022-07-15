class StringInputDigitError < StandardError

    def initialize(options)
    end
    
    def message
        'The string must include a number.'
    end
end
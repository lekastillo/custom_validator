class StringInputDigitValidator

    def initialize(text, options={})
        @text = text
    end

    def validate
        @text.match(/\d/)
    end

end
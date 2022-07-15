class StringInputUppercaseValidator

    def initialize(text, options={})
        @text = text
    end

    def validate
        @text.match(/[A-Z]/)
    end

end